import 'package:dockcheck_client/dockcheck_client.dart';
import 'package:flutter/material.dart';

import '../state/dock_store.dart';

/// Red for high risk, amber for medium, blue-grey for low.
Color severityColor(int severity) {
  if (severity >= 70) return const Color(0xFFC62828);
  if (severity >= 40) return const Color(0xFFEF6C00);
  return const Color(0xFF546E7A);
}

String severityLabel(int severity) {
  if (severity >= 70) return 'HIGH';
  if (severity >= 40) return 'MEDIUM';
  return 'LOW';
}

/// "closes in 5 h" / "closed" for a claim deadline.
String deadlineText(DateTime deadline) {
  final left = deadline.toUtc().difference(DateTime.now().toUtc());
  if (left.isNegative) return 'claim window closed';
  if (left.inHours >= 48) return 'claim closes in ${left.inDays} days';
  if (left.inHours >= 1) return 'claim closes in ${left.inHours} h';
  return 'claim closes in ${left.inMinutes} min';
}

String timeAgo(DateTime time) {
  final diff = DateTime.now().toUtc().difference(time.toUtc());
  if (diff.inMinutes < 1) return 'just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
  if (diff.inHours < 24) return '${diff.inHours} h ago';
  return '${diff.inDays} d ago';
}

void showMessage(BuildContext context, String message, {bool error = false}) {
  final colors = Theme.of(context).colorScheme;
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: error ? colors.onErrorContainer : colors.onInverseSurface,
          ),
        ),
        backgroundColor: error ? colors.errorContainer : colors.inverseSurface,
      ),
    );
}

/// Turns a thrown error into text for the user.
String errorText(Object error) {
  if (error is DockException) return error.message;
  return 'Could not reach the server. Your work is saved on this device.';
}

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.shipment});

  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    final waiting =
        shipment.id != null &&
        store.hasPending(shipment.id!) &&
        shipment.status == ShipmentStatus.expected;
    final (label, color, icon) = waiting
        ? ('Saved offline, waiting to sync', Colors.indigo, Icons.cloud_off)
        : switch (shipment.status) {
            ShipmentStatus.expected => (
              'Expected',
              Colors.blueGrey,
              Icons.local_shipping_outlined,
            ),
            ShipmentStatus.clean => (
              'Received clean',
              Colors.green,
              Icons.check_circle_outline,
            ),
            ShipmentStatus.discrepancy => (
              'Needs claim',
              Colors.deepOrange,
              Icons.warning_amber_rounded,
            ),
            ShipmentStatus.claimFiled => (
              'Claim filed',
              Colors.teal,
              Icons.assignment_turned_in_outlined,
            ),
          };
    return Chip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(label),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.w600),
      side: BorderSide(color: color.withValues(alpha: 0.4)),
      backgroundColor: color.withValues(alpha: 0.08),
      visualDensity: VisualDensity.compact,
    );
  }
}

/// Shows connection state, the offline demo switch, and what is waiting to
/// sync. Used on every home screen so the offline behaviour is visible.
class SyncBanner extends StatelessWidget {
  const SyncBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final waiting = store.pending.length;
    final offline = store.offline;

    final String text;
    if (store.syncing) {
      text = 'Syncing $waiting saved receipt(s)...';
    } else if (offline && waiting > 0) {
      text = 'No connection. $waiting receipt(s) saved on this device.';
    } else if (offline) {
      text = 'No connection. You can keep working, everything is saved here.';
    } else if (waiting > 0) {
      text = '$waiting receipt(s) waiting to sync.';
    } else {
      text = 'Online. All changes are on the server.';
    }

    return Material(
      color: offline ? colors.tertiaryContainer : colors.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Icon(
              offline ? Icons.cloud_off : Icons.cloud_done_outlined,
              size: 18,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodySmall),
            ),
            if (waiting > 0 && !offline && !store.syncing)
              TextButton(
                onPressed: store.syncPending,
                child: const Text('Sync now'),
              ),
            Tooltip(
              message: 'Pretend there is no signal (for demos)',
              child: Row(
                children: [
                  Text('Offline', style: Theme.of(context).textTheme.bodySmall),
                  Switch(
                    value: store.simulateOffline,
                    onChanged: store.setSimulateOffline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
