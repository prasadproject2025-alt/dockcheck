import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'dock_access.dart';

/// Recurring job that protects the money: it reminds supervisors before a
/// carrier's claim window closes and flags carriers with repeat problems.
class DeadlineScanFutureCall extends FutureCall {
  static const reminderWindow = Duration(hours: 24);
  static const _cooldown = Duration(hours: 12);

  /// Alerts on unfiled claims whose deadline is close. Safe to run repeatedly:
  /// a shipment is reminded at most once per cooldown period.
  Future<void> scanDeadlines(Session session) async {
    final now = DateTime.now().toUtc();
    final soon = now.add(reminderWindow);

    final open = await Shipment.db.find(
      session,
      where: (t) =>
          t.status.equals(ShipmentStatus.discrepancy) &
          (t.claimDeadline > now) &
          (t.claimDeadline < soon),
    );

    for (final shipment in open) {
      final recent = await DockAlert.db.count(
        session,
        where: (t) =>
            t.shipmentId.equals(shipment.id!) &
            t.kind.equals('deadline') &
            (t.createdAt > now.subtract(_cooldown)),
      );
      if (recent > 0) continue;

      final hoursLeft = shipment.claimDeadline.difference(now).inHours;
      await raiseAlert(
        session,
        shipmentId: shipment.id!,
        kind: 'deadline',
        title: 'Claim closing: ${shipment.reference}',
        message:
            'The ${shipment.carrier} claim window closes in about '
            '$hoursLeft h and no claim has been filed.',
        severity: hoursLeft <= 6 ? 90 : 60,
      );
    }
  }

  /// One summary alert per carrier with repeated problems in the last 30 days.
  /// Skips carriers already summarised in the last 24 hours.
  Future<void> dailySummary(Session session) async {
    final now = DateTime.now().toUtc();
    final since = now.subtract(const Duration(days: 30));

    final problems = await Shipment.db.find(
      session,
      where: (t) =>
          (t.createdAt > since) &
          (t.status.equals(ShipmentStatus.discrepancy) |
              t.status.equals(ShipmentStatus.claimFiled)),
    );
    final byCarrier = <String, int>{};
    for (final s in problems) {
      byCarrier[s.carrier] = (byCarrier[s.carrier] ?? 0) + 1;
    }

    for (final entry in byCarrier.entries.where((e) => e.value >= 2)) {
      final title = 'Carrier watch: ${entry.key}';
      final already = await DockAlert.db.count(
        session,
        where: (t) =>
            t.kind.equals('summary') &
            t.title.equals(title) &
            (t.createdAt > now.subtract(const Duration(hours: 24))),
      );
      if (already > 0) continue;

      await raiseAlert(
        session,
        shipmentId: 0,
        kind: 'summary',
        title: title,
        message:
            '${entry.key} had ${entry.value} problem deliveries in the '
            'last 30 days.',
        severity: 50,
      );
    }
  }
}
