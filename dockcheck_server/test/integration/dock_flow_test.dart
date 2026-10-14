import 'dart:typed_data';

import 'package:dockcheck_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

const _supervisorId = '550e8400-e29b-41d4-a716-446655440001';
const _workerId = '550e8400-e29b-41d4-a716-446655440002';

ByteData _photo() => ByteData.view(Uint8List.fromList([1, 2, 3, 4]).buffer);

void main() {
  withServerpod('Given the DockCheck endpoints', (sessionBuilder, endpoints) {
    final supervisor = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        _supervisorId,
        {},
      ),
    );
    final worker = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(_workerId, {}),
    );

    setUp(() async {
      await endpoints.staff.register(
        supervisor,
        displayName: 'Sita',
        role: StaffRoleType.supervisor,
        inviteCode: 'DOCK-SUPERVISOR',
      );
      await endpoints.staff.register(
        worker,
        displayName: 'Ravi',
        role: StaffRoleType.worker,
      );
    });

    Future<Shipment> createShipment() => endpoints.shipment.createShipment(
      supervisor,
      NewShipment(
        reference: 'MH-12-4410',
        carrier: 'Blue Dart',
        claimWindowHours: 48,
        items: [
          NewShipmentItem(description: 'Carton A', expectedQty: 40),
          NewShipmentItem(description: 'Mattress', expectedQty: 10),
        ],
      ),
    );

    group('registering staff', () {
      test('when a worker claims supervisor with a wrong code then it is '
          'rejected', () async {
        final stranger = sessionBuilder.copyWith(
          authentication: AuthenticationOverride.authenticationInfo(
            '550e8400-e29b-41d4-a716-446655440003',
            {},
          ),
        );
        await expectLater(
          endpoints.staff.register(
            stranger,
            displayName: 'Mallory',
            role: StaffRoleType.supervisor,
            inviteCode: 'guess',
          ),
          throwsA(isA<DockException>()),
        );
      });
    });

    group('creating shipments', () {
      test('when a worker creates one then it is rejected', () async {
        await expectLater(
          endpoints.shipment.createShipment(
            worker,
            NewShipment(
              reference: 'X',
              carrier: 'Y',
              claimWindowHours: 24,
              items: [NewShipmentItem(description: 'A', expectedQty: 1)],
            ),
          ),
          throwsA(isA<DockException>()),
        );
      });

      test('when a supervisor creates one then it is expected with its '
          'items', () async {
        final shipment = await createShipment();
        expect(shipment.status, ShipmentStatus.expected);
        expect(shipment.items, hasLength(2));
      });
    });

    group('receiving a shipment with 2 cartons short and 1 damaged', () {
      late Shipment shipment;
      late Receipt receipt;

      setUp(() async {
        shipment = await createShipment();
        final carton = shipment.items!.firstWhere(
          (i) => i.description == 'Carton A',
        );
        final mattress = shipment.items!.firstWhere(
          (i) => i.description == 'Mattress',
        );
        receipt = Receipt(
          receiptId: 'receipt-1',
          shipmentId: shipment.id!,
          recordedAt: DateTime.now().toUtc(),
          lines: [
            ReceiptLine(
              shipmentItemId: carton.id!,
              receivedQty: 38,
              damagedQty: 1,
              photos: [_photo()],
            ),
            ReceiptLine(
              shipmentItemId: mattress.id!,
              receivedQty: 10,
              damagedQty: 0,
              photos: [],
            ),
          ],
        );
      });

      test('then the server finds the discrepancies and a supervisor alert '
          'is raised', () async {
        final saved = await endpoints.shipment.submitReceipt(worker, receipt);
        expect(saved.status, ShipmentStatus.discrepancy);
        expect(saved.receivedByName, 'Ravi');

        final found = await endpoints.shipment.listDiscrepancies(
          supervisor,
          shipment.id!,
        );
        expect(
          found.map((d) => d.kind),
          containsAll([DiscrepancyKind.short, DiscrepancyKind.damaged]),
        );

        final alerts = await endpoints.alert.listAlerts(supervisor);
        expect(alerts.single.shipmentId, shipment.id);
      });

      test('then the damage photo is stored with the item', () async {
        final saved = await endpoints.shipment.submitReceipt(worker, receipt);
        final carton = saved.items!.firstWhere(
          (i) => i.description == 'Carton A',
        );
        expect(carton.photos, hasLength(1));
        expect(carton.photos!.single.url, isNotNull);
      });

      test('when the same receipt is synced twice then nothing is '
          'duplicated', () async {
        await endpoints.shipment.submitReceipt(worker, receipt);
        await endpoints.shipment.submitReceipt(worker, receipt);

        final found = await endpoints.shipment.listDiscrepancies(
          supervisor,
          shipment.id!,
        );
        expect(found, hasLength(2));
        expect(await endpoints.alert.listAlerts(supervisor), hasLength(1));
      });

      test('when a different receipt arrives for the same shipment then it '
          'is rejected', () async {
        await endpoints.shipment.submitReceipt(worker, receipt);
        await expectLater(
          endpoints.shipment.submitReceipt(
            worker,
            Receipt(
              receiptId: 'receipt-2',
              shipmentId: receipt.shipmentId,
              recordedAt: DateTime.now().toUtc(),
              lines: receipt.lines,
            ),
          ),
          throwsA(isA<DockException>()),
        );
      });

      test(
        'when a worker asks for the alert list then it is rejected',
        () async {
          await expectLater(
            endpoints.alert.listAlerts(worker),
            throwsA(isA<DockException>()),
          );
        },
      );

      test('when the supervisor generates the claim then the report lists '
          'the findings and the shipment becomes claim filed', () async {
        await endpoints.shipment.submitReceipt(worker, receipt);
        final report = await endpoints.shipment.generateClaimReport(
          supervisor,
          shipment.id!,
        );
        expect(report.reportText, contains('Blue Dart'));
        expect(report.reportText, contains('Carton A'));
        expect(report.photoUrls, hasLength(1));
        expect(report.shipment.status, ShipmentStatus.claimFiled);
      });
    });

    group('receiving a perfect shipment', () {
      test('then it is clean and no alert is raised', () async {
        final shipment = await createShipment();
        final saved = await endpoints.shipment.submitReceipt(
          worker,
          Receipt(
            receiptId: 'clean-1',
            shipmentId: shipment.id!,
            recordedAt: DateTime.now().toUtc(),
            lines: [
              for (final item in shipment.items!)
                ReceiptLine(
                  shipmentItemId: item.id!,
                  receivedQty: item.expectedQty,
                  damagedQty: 0,
                  photos: [],
                ),
            ],
          ),
        );
        expect(saved.status, ShipmentStatus.clean);
        expect(await endpoints.alert.listAlerts(supervisor), isEmpty);
      });
    });

    test('when a receipt claims more damaged than received then it is '
        'rejected', () async {
      final shipment = await createShipment();
      await expectLater(
        endpoints.shipment.submitReceipt(
          worker,
          Receipt(
            receiptId: 'bad-1',
            shipmentId: shipment.id!,
            recordedAt: DateTime.now().toUtc(),
            lines: [
              ReceiptLine(
                shipmentItemId: shipment.items!.first.id!,
                receivedQty: 1,
                damagedQty: 5,
                photos: [],
              ),
            ],
          ),
        ),
        throwsA(isA<DockException>()),
      );
    });
  });
}
