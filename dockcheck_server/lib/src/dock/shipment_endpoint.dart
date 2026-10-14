import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'analysis.dart';
import 'dock_access.dart';

/// Expected shipments, receiving at the dock, discrepancies and claims.
class ShipmentEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _storageId = 'public';
  static const _maxPhotoBytes = 6 * 1024 * 1024;

  static final _fullInclude = Shipment.include(
    items: ShipmentItem.includeList(
      orderBy: (t) => t.id,
      include: ShipmentItem.include(photos: DamagePhoto.includeList()),
    ),
  );

  /// Supervisor registers an expected delivery.
  Future<Shipment> createShipment(Session session, NewShipment input) async {
    final staff = await requireSupervisor(session);

    final reference = input.reference.trim();
    final carrier = input.carrier.trim();
    if (reference.isEmpty || carrier.isEmpty) {
      throw DockException(message: 'Reference and carrier are required.');
    }
    if (input.items.isEmpty) {
      throw DockException(message: 'Add at least one expected item.');
    }
    if (input.items.any((i) => i.expectedQty <= 0)) {
      throw DockException(message: 'Expected quantities must be above zero.');
    }
    if (input.claimWindowHours <= 0) {
      throw DockException(message: 'The claim window must be above zero.');
    }

    final created = await session.db.transaction((tx) async {
      final shipment = await Shipment.db.insertRow(
        session,
        Shipment(
          reference: reference,
          carrier: carrier,
          claimDeadline: DateTime.now().toUtc().add(
            Duration(hours: input.claimWindowHours),
          ),
          createdByUserId: staff.authUserId,
        ),
        transaction: tx,
      );
      await ShipmentItem.db.insert(
        session,
        input.items
            .map(
              (i) => ShipmentItem(
                shipmentId: shipment.id!,
                description: i.description.trim(),
                expectedQty: i.expectedQty,
              ),
            )
            .toList(),
        transaction: tx,
      );
      return shipment;
    });

    return (await _load(session, created.id!))!;
  }

  /// All shipments, newest first.
  Future<List<Shipment>> listShipments(Session session) async {
    await requireStaff(session);
    final shipments = await Shipment.db.find(
      session,
      orderByList: (t) => [t.createdAt.desc()],
      include: _fullInclude,
    );
    for (final s in shipments) {
      await _attachPhotoUrls(session, s);
    }
    return shipments;
  }

  /// One shipment with items and photos.
  Future<Shipment?> getShipment(Session session, int shipmentId) async {
    await requireStaff(session);
    return _load(session, shipmentId);
  }

  /// Discrepancies the server found for a shipment, worst first.
  Future<List<Discrepancy>> listDiscrepancies(
    Session session,
    int shipmentId,
  ) async {
    await requireStaff(session);
    return Discrepancy.db.find(
      session,
      where: (t) => t.shipmentId.equals(shipmentId),
      orderByList: (t) => [t.severity.desc()],
    );
  }

  /// Records what arrived. Safe to retry: a repeated [Receipt.receiptId]
  /// returns the stored result instead of duplicating it, which is what lets
  /// the app queue receipts offline and sync them later.
  Future<Shipment> submitReceipt(Session session, Receipt receipt) async {
    final staff = await requireStaff(session);

    final shipment = await _load(session, receipt.shipmentId);
    if (shipment == null) {
      throw DockException(message: 'Shipment not found.');
    }
    if (shipment.receiptId == receipt.receiptId) return shipment;
    if (shipment.receiptId != null) {
      throw DockException(
        message: 'This shipment was already received and checked.',
      );
    }

    final lineByItem = {for (final l in receipt.lines) l.shipmentItemId: l};
    final items = shipment.items ?? <ShipmentItem>[];
    for (final line in receipt.lines) {
      if (!items.any((i) => i.id == line.shipmentItemId)) {
        throw DockException(message: 'Unknown item on this shipment.');
      }
      if (line.receivedQty < 0 ||
          line.damagedQty < 0 ||
          line.damagedQty > line.receivedQty) {
        throw DockException(
          message: 'Damaged items cannot exceed received items.',
        );
      }
      for (final photo in line.photos) {
        if (photo.lengthInBytes > _maxPhotoBytes) {
          throw DockException(message: 'A photo is larger than 6 MB.');
        }
      }
    }

    final counts = <ItemCount>[];
    final photoRows = <DamagePhoto>[];
    final updatedItems = <ShipmentItem>[];

    for (final item in items) {
      final line = lineByItem[item.id];
      final received = line?.receivedQty ?? 0;
      final damaged = line?.damagedQty ?? 0;
      final photos = line?.photos ?? const <ByteData>[];

      for (var n = 0; n < photos.length; n++) {
        final path =
            'shipments/${shipment.id}/items/${item.id}/'
            '${receipt.receiptId}-$n.jpg';
        await session.storage.storeFile(
          storageId: _storageId,
          path: path,
          byteData: photos[n],
        );
        photoRows.add(
          DamagePhoto(itemId: item.id!, storagePath: path),
        );
      }

      updatedItems.add(
        item.copyWith(
          receivedQty: received,
          damagedQty: damaged,
          note: line?.note,
          photos: null,
        ),
      );
      counts.add(
        ItemCount(
          description: item.description,
          expectedQty: item.expectedQty,
          receivedQty: received,
          damagedQty: damaged,
          photoCount: photos.length,
        ),
      );
    }

    final drafts = analyzeItems(counts);
    final severity = overallSeverity(drafts);

    await session.db.transaction((tx) async {
      // Re-check inside the transaction so two phones syncing the same
      // shipment cannot both win.
      final current = await Shipment.db.findById(
        session,
        shipment.id!,
        transaction: tx,
        lockMode: LockMode.forUpdate,
      );
      if (current!.receiptId != null) {
        throw DockException(
          message: 'This shipment was already received and checked.',
        );
      }

      await ShipmentItem.db.update(session, updatedItems, transaction: tx);
      if (photoRows.isNotEmpty) {
        await DamagePhoto.db.insert(session, photoRows, transaction: tx);
      }
      if (drafts.isNotEmpty) {
        await Discrepancy.db.insert(
          session,
          drafts
              .map(
                (d) => Discrepancy(
                  shipmentId: shipment.id!,
                  itemDescription: d.itemDescription,
                  kind: d.kind,
                  quantity: d.quantity,
                  severity: d.severity,
                  explanation: d.explanation,
                ),
              )
              .toList(),
          transaction: tx,
        );
      }
      await Shipment.db.updateRow(
        session,
        current.copyWith(
          status: drafts.isEmpty
              ? ShipmentStatus.clean
              : ShipmentStatus.discrepancy,
          receivedAt: receipt.recordedAt.toUtc(),
          receivedByName: staff.displayName,
          receiptId: receipt.receiptId,
        ),
        transaction: tx,
      );
    });

    if (drafts.isNotEmpty) {
      await raiseAlert(
        session,
        shipmentId: shipment.id!,
        kind: 'discrepancy',
        title: '${severityLabel(severity)} risk: ${shipment.reference}',
        message:
            '${drafts.length} issue(s) on ${shipment.carrier} delivery '
            '${shipment.reference}. ${drafts.first.explanation}',
        severity: severity,
      );
    }

    return (await _load(session, shipment.id!))!;
  }

  /// Builds the evidence pack for the carrier and marks the claim as filed.
  Future<ClaimReport> generateClaimReport(
    Session session,
    int shipmentId,
  ) async {
    await requireSupervisor(session);
    final shipment = await _load(session, shipmentId);
    if (shipment == null) {
      throw DockException(message: 'Shipment not found.');
    }
    if (shipment.status == ShipmentStatus.expected) {
      throw DockException(message: 'This shipment has not been received yet.');
    }

    final discrepancies = await Discrepancy.db.find(
      session,
      where: (t) => t.shipmentId.equals(shipmentId),
      orderByList: (t) => [t.severity.desc()],
    );
    final photoUrls = [
      for (final item in shipment.items ?? <ShipmentItem>[])
        for (final photo in item.photos ?? <DamagePhoto>[])
          if (photo.url != null) photo.url!,
    ];

    final now = DateTime.now().toUtc();
    final buffer = StringBuffer()
      ..writeln('DAMAGE / SHORTAGE CLAIM')
      ..writeln('Carrier: ${shipment.carrier}')
      ..writeln('Shipment: ${shipment.reference}')
      ..writeln(
        'Received: ${shipment.receivedAt?.toIso8601String()} '
        'by ${shipment.receivedByName}',
      )
      ..writeln('Claim deadline: ${shipment.claimDeadline.toIso8601String()}')
      ..writeln();
    if (discrepancies.isEmpty) {
      buffer.writeln('No discrepancies were recorded for this delivery.');
    } else {
      buffer.writeln('Findings:');
      for (final d in discrepancies) {
        buffer.writeln(
          '- ${d.itemDescription} [${d.kind.name}, severity ${d.severity}]: '
          '${d.explanation}',
        );
      }
    }
    buffer
      ..writeln()
      ..writeln('Photo evidence (${photoUrls.length}):');
    for (final url in photoUrls) {
      buffer.writeln('- $url');
    }
    buffer
      ..writeln()
      ..writeln('Generated by DockCheck on ${now.toIso8601String()}.');

    var updated = shipment;
    if (shipment.status == ShipmentStatus.discrepancy) {
      await Shipment.db.updateRow(
        session,
        shipment.copyWith(status: ShipmentStatus.claimFiled, items: null),
      );
      updated = (await _load(session, shipmentId))!;
    }

    return ClaimReport(
      shipment: updated,
      discrepancies: discrepancies,
      photoUrls: photoUrls,
      reportText: buffer.toString(),
      generatedAt: now,
    );
  }

  Future<Shipment?> _load(Session session, int id) async {
    final shipment = await Shipment.db.findById(
      session,
      id,
      include: _fullInclude,
    );
    if (shipment != null) await _attachPhotoUrls(session, shipment);
    return shipment;
  }

  Future<void> _attachPhotoUrls(Session session, Shipment shipment) async {
    for (final item in shipment.items ?? <ShipmentItem>[]) {
      for (final photo in item.photos ?? <DamagePhoto>[]) {
        final uri = await session.storage.publicDownloadUrl(
          storageId: _storageId,
          path: photo.storagePath,
        );
        photo.url = uri.toString();
      }
    }
  }
}
