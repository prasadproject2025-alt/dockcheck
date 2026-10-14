import 'dart:async';

import 'package:dockcheck_client/dockcheck_client.dart';
import 'package:flutter/material.dart';

import '../state/dock_store.dart';
import '../widgets/common.dart';
import 'create_shipment_screen.dart';
import 'shipment_detail_screen.dart';
import 'staff_gate.dart';

/// Supervisor home: all shipments and the live alert feed.
class SupervisorShell extends StatefulWidget {
  const SupervisorShell({super.key});

  @override
  State<SupervisorShell> createState() => _SupervisorShellState();
}

class _SupervisorShellState extends State<SupervisorShell> {
  int _tab = 0;
  StreamSubscription<DockAlert>? _liveSub;

  @override
  void initState() {
    super.initState();
    store.addListener(_onChange);
    _liveSub = store.liveAlerts.listen(_onLiveAlert);
  }

  @override
  void dispose() {
    store.removeListener(_onChange);
    _liveSub?.cancel();
    super.dispose();
  }

  void _onChange() {
    if (!mounted) return;
    setState(() {});
    final notice = store.notice;
    if (notice != null) {
      store.clearNotice();
      showMessage(context, notice);
    }
  }

  void _onLiveAlert(DockAlert alert) {
    if (!mounted) return;
    final color = severityColor(alert.severity);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color,
          duration: const Duration(seconds: 8),
          content: Text(
            '${alert.title}\n${alert.message}',
            style: const TextStyle(color: Colors.white),
          ),
          action: alert.shipmentId > 0
              ? SnackBarAction(
                  label: 'OPEN',
                  textColor: Colors.white,
                  onPressed: () => _openShipment(alert.shipmentId),
                )
              : null,
        ),
      );
  }

  void _openShipment(int id) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ShipmentDetailScreen(shipmentId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final unread = store.unreadAlerts;
    return Scaffold(
      appBar: AppBar(
        title: Text('Supervisor · ${store.profile?.displayName ?? ''}'),
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
            child: _tab == 0
                ? _ShipmentsTab(onOpen: _openShipment)
                : _AlertsTab(onOpen: _openShipment),
          ),
        ],
      ),
      floatingActionButton: _tab == 0
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CreateShipmentScreen()),
              ),
              icon: const Icon(Icons.add),
              label: const Text('Expect a shipment'),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.local_shipping_outlined),
            label: 'Shipments',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: unread > 0,
              label: Text('$unread'),
              child: const Icon(Icons.notifications_outlined),
            ),
            label: 'Alerts',
          ),
        ],
      ),
    );
  }
}

class _ShipmentsTab extends StatelessWidget {
  const _ShipmentsTab({required this.onOpen});

  final ValueChanged<int> onOpen;

  @override
  Widget build(BuildContext context) {
    final shipments = store.shipments;
    return RefreshIndicator(
      onRefresh: store.refresh,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        children: [
          if (shipments.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 48),
              child: Center(
                child: Text('No shipments yet. Tap "Expect a shipment".'),
              ),
            ),
          for (final s in shipments)
            Card(
              child: ListTile(
                onTap: () => onOpen(s.id!),
                title: Text('${s.reference} · ${s.carrier}'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Wrap(
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      StatusChip(shipment: s),
                      if (s.status == ShipmentStatus.discrepancy)
                        Text(deadlineText(s.claimDeadline)),
                    ],
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
        ],
      ),
    );
  }
}

class _AlertsTab extends StatelessWidget {
  const _AlertsTab({required this.onOpen});

  final ValueChanged<int> onOpen;

  @override
  Widget build(BuildContext context) {
    final alerts = store.alerts;
    return RefreshIndicator(
      onRefresh: store.refresh,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (alerts.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: store.unreadAlerts == 0
                    ? null
                    : store.markAlertsRead,
                icon: const Icon(Icons.done_all),
                label: const Text('Mark all read'),
              ),
            ),
          if (alerts.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 48),
              child: Center(child: Text('No alerts yet.')),
            ),
          for (final a in alerts)
            Card(
              child: ListTile(
                onTap: a.shipmentId > 0 ? () => onOpen(a.shipmentId) : null,
                leading: CircleAvatar(
                  backgroundColor: severityColor(a.severity),
                  child: Text(
                    severityLabel(a.severity).substring(0, 1),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  a.title,
                  style: TextStyle(
                    fontWeight: a.readAt == null
                        ? FontWeight.w700
                        : FontWeight.w400,
                  ),
                ),
                subtitle: Text('${a.message}\n${timeAgo(a.createdAt)}'),
                isThreeLine: true,
              ),
            ),
        ],
      ),
    );
  }
}
