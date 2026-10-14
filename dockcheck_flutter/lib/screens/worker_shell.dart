import 'package:dockcheck_client/dockcheck_client.dart';
import 'package:flutter/material.dart';

import '../state/dock_store.dart';
import '../widgets/common.dart';
import 'receive_screen.dart';
import 'shipment_detail_screen.dart';
import 'staff_gate.dart';

/// Dock worker home: deliveries to check, with the offline queue on top.
class WorkerShell extends StatefulWidget {
  const WorkerShell({super.key});

  @override
  State<WorkerShell> createState() => _WorkerShellState();
}

class _WorkerShellState extends State<WorkerShell> {
  @override
  void initState() {
    super.initState();
    store.addListener(_onChange);
  }

  @override
  void dispose() {
    store.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    if (!mounted) return;
    setState(() {});
    final notice = store.notice;
    if (notice != null) {
      store.clearNotice();
      showMessage(context, notice, error: notice.contains('rejected'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final todo = store.shipments
        .where(
          (s) =>
              s.status == ShipmentStatus.expected &&
              !store.hasPending(s.id ?? -1),
        )
        .toList();
    final done = store.shipments.where((s) => !todo.contains(s)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi ${store.profile?.displayName ?? ''}'),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: store.refresh,
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            tooltip: 'Sign out',
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          const SyncBanner(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: store.refresh,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    'To check',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  if (todo.isEmpty)
                    const _Empty(
                      'No deliveries waiting. Pull down to refresh.',
                    ),
                  for (final s in todo)
                    _ShipmentCard(
                      shipment: s,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ReceiveScreen(shipment: s),
                        ),
                      ),
                      actionLabel: 'Start check',
                    ),
                  if (done.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Checked',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    for (final s in done)
                      _ShipmentCard(
                        shipment: s,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                ShipmentDetailScreen(shipmentId: s.id!),
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Center(child: Text(text)),
  );
}

class _ShipmentCard extends StatelessWidget {
  const _ShipmentCard({
    required this.shipment,
    required this.onTap,
    this.actionLabel,
  });

  final Shipment shipment;
  final VoidCallback onTap;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    final items = shipment.items ?? <ShipmentItem>[];
    final units = items.fold<int>(0, (sum, i) => sum + i.expectedQty);
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      shipment.reference,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  StatusChip(shipment: shipment),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${shipment.carrier} · ${items.length} lines · $units units',
              ),
              if (actionLabel != null) ...[
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton.tonal(
                    onPressed: onTap,
                    child: Text(actionLabel!),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
