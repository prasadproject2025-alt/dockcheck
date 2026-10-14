import 'package:dockcheck_client/dockcheck_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../client.dart';
import '../state/dock_store.dart';
import '../widgets/common.dart';

/// What was expected, what was counted, what the server found wrong, the photo
/// evidence, and (for supervisors) the claim report.
class ShipmentDetailScreen extends StatefulWidget {
  const ShipmentDetailScreen({super.key, required this.shipmentId});

  final int shipmentId;

  @override
  State<ShipmentDetailScreen> createState() => _ShipmentDetailScreenState();
}

class _ShipmentDetailScreenState extends State<ShipmentDetailScreen> {
  List<Discrepancy> _discrepancies = [];
  bool _busy = false;
  int _loadedForStatus = -1;

  @override
  void initState() {
    super.initState();
    store.addListener(_onChange);
    _loadDiscrepancies();
  }

  @override
  void dispose() {
    store.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    if (!mounted) return;
    setState(() {});
    final status = store.shipmentById(widget.shipmentId)?.status.index ?? -1;
    if (status != _loadedForStatus) _loadDiscrepancies();
  }

  Future<void> _loadDiscrepancies() async {
    final shipment = store.shipmentById(widget.shipmentId);
    _loadedForStatus = shipment?.status.index ?? -1;
    if (shipment == null || shipment.status == ShipmentStatus.expected) return;
    try {
      final found = await client.shipment.listDiscrepancies(widget.shipmentId);
      if (mounted) setState(() => _discrepancies = found);
    } catch (_) {
      // Offline: the shipment table below still shows the counts.
    }
  }

  Future<void> _claim() async {
    setState(() => _busy = true);
    try {
      final report = await client.shipment.generateClaimReport(
        widget.shipmentId,
      );
      await store.refresh();
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Claim report'),
          content: SizedBox(
            width: 520,
            child: SingleChildScrollView(
              child: SelectableText(report.reportText),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: report.reportText));
                if (context.mounted) {
                  showMessage(
                    context,
                    'Report copied. Paste it into your email.',
                  );
                }
              },
              child: const Text('Copy'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Done'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (mounted) showMessage(context, errorText(e), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final shipment = store.shipmentById(widget.shipmentId);
    if (shipment == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Shipment not found.')),
      );
    }
    final theme = Theme.of(context);
    final canClaim =
        store.isSupervisor &&
        (shipment.status == ShipmentStatus.discrepancy ||
            shipment.status == ShipmentStatus.claimFiled);

    return Scaffold(
      appBar: AppBar(title: Text(shipment.reference)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  shipment.carrier,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              StatusChip(shipment: shipment),
            ],
          ),
          const SizedBox(height: 4),
          if (shipment.receivedAt != null)
            Text(
              'Received ${timeAgo(shipment.receivedAt!)} by '
              '${shipment.receivedByName ?? 'unknown'}',
            ),
          Text(deadlineText(shipment.claimDeadline)),
          if (_discrepancies.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text('What the server found', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            for (final d in _discrepancies) _DiscrepancyTile(d),
          ],
          const SizedBox(height: 16),
          Text('Items', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          for (final item in shipment.items ?? <ShipmentItem>[])
            _ItemTile(item: item, received: shipment.receiptId != null),
          if (canClaim) ...[
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _busy ? null : _claim,
              icon: const Icon(Icons.description_outlined),
              label: Text(
                shipment.status == ShipmentStatus.claimFiled
                    ? 'View claim report'
                    : 'Generate claim report',
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DiscrepancyTile extends StatelessWidget {
  const _DiscrepancyTile(this.d);

  final Discrepancy d;

  @override
  Widget build(BuildContext context) {
    final color = severityColor(d.severity);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withValues(alpha: 0.5)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            '${d.severity}',
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
        title: Text('${d.itemDescription} · ${d.kind.name}'),
        subtitle: Text(
          '${severityLabel(d.severity)} risk. ${d.explanation}',
        ),
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item, required this.received});

  final ShipmentItem item;
  final bool received;

  @override
  Widget build(BuildContext context) {
    final photos = item.photos ?? <DamagePhoto>[];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.description,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            Text(
              received
                  ? 'Expected ${item.expectedQty} · received '
                        '${item.receivedQty ?? 0} · damaged ${item.damagedQty}'
                  : 'Expected ${item.expectedQty}',
            ),
            if (item.note != null && item.note!.isNotEmpty)
              Text('Note: ${item.note}'),
            if (photos.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final p in photos)
                    if (p.url != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          p.url!,
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const SizedBox(
                            width: 96,
                            height: 96,
                            child: Icon(Icons.broken_image_outlined),
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
