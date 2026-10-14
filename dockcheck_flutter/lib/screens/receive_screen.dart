import 'package:dockcheck_client/dockcheck_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../state/dock_store.dart';
import '../widgets/common.dart';

/// The worker counts each line, flags damage and attaches photos. Nothing here
/// needs a connection: submitting saves to the phone and the queue syncs it.
class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({super.key, required this.shipment});

  final Shipment shipment;

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _LineState {
  _LineState(this.item) : received = item.expectedQty;

  final ShipmentItem item;
  int received;
  int damaged = 0;
  final List<Uint8List> photos = [];
  final note = TextEditingController();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  late final List<_LineState> _lines = [
    for (final item in widget.shipment.items ?? <ShipmentItem>[])
      _LineState(item),
  ];
  final _picker = ImagePicker();
  bool _saving = false;

  @override
  void dispose() {
    for (final l in _lines) {
      l.note.dispose();
    }
    super.dispose();
  }

  bool get _hasCamera =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  Future<void> _addPhoto(_LineState line) async {
    try {
      final file = await _picker.pickImage(
        source: _hasCamera ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1280,
        imageQuality: 70,
      );
      if (file == null) return;
      final bytes = await file.readAsBytes();
      if (bytes.lengthInBytes > 6 * 1024 * 1024) {
        if (mounted) showMessage(context, 'Photo is too large.', error: true);
        return;
      }
      setState(() => line.photos.add(bytes));
    } catch (e) {
      if (mounted)
        showMessage(context, 'Could not add the photo.', error: true);
    }
  }

  Future<void> _submit() async {
    setState(() => _saving = true);
    final receipt = PendingReceipt(
      receiptId: newReceiptId(),
      shipmentId: widget.shipment.id!,
      recordedAt: DateTime.now().toUtc(),
      lines: [
        for (final l in _lines)
          PendingLine(
            shipmentItemId: l.item.id!,
            receivedQty: l.received,
            damagedQty: l.damaged,
            note: l.note.text.trim().isEmpty ? null : l.note.text.trim(),
            photos: l.photos,
          ),
      ],
    );
    await store.queueReceipt(receipt);
    if (!mounted) return;
    Navigator.of(context).pop();
    showMessage(
      context,
      store.offline
          ? 'Saved on this device. It will sync when you are back online.'
          : 'Saved. Sending to the server...',
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.shipment;
    return Scaffold(
      appBar: AppBar(title: Text('Check ${s.reference}')),
      body: Column(
        children: [
          const SyncBanner(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  '${s.carrier}. Count what actually came off the truck.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                for (final line in _lines) _lineCard(context, line),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: _saving ? null : _submit,
            icon: const Icon(Icons.check),
            label: const Text('Finish check'),
          ),
        ),
      ),
    );
  }

  Widget _lineCard(BuildContext context, _LineState line) {
    final item = line.item;
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.description, style: theme.textTheme.titleMedium),
            Text('Expected ${item.expectedQty}'),
            const SizedBox(height: 8),
            _Stepper(
              label: 'Received',
              value: line.received,
              onChanged: (v) => setState(() {
                line.received = v;
                if (line.damaged > v) line.damaged = v;
              }),
            ),
            _Stepper(
              label: 'Damaged',
              value: line.damaged,
              max: line.received,
              onChanged: (v) => setState(() => line.damaged = v),
            ),
            if (line.received != item.expectedQty || line.damaged > 0)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  [
                    if (line.received < item.expectedQty)
                      '${item.expectedQty - line.received} short',
                    if (line.received > item.expectedQty)
                      '${line.received - item.expectedQty} extra',
                    if (line.damaged > 0) '${line.damaged} damaged',
                  ].join(', '),
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if (line.damaged > 0) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var i = 0; i < line.photos.length; i++)
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            line.photos[i],
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: InkWell(
                            onTap: () =>
                                setState(() => line.photos.removeAt(i)),
                            child: const CircleAvatar(
                              radius: 10,
                              child: Icon(Icons.close, size: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  OutlinedButton.icon(
                    onPressed: () => _addPhoto(line),
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: Text(
                      line.photos.isEmpty ? 'Add damage photo' : 'Add another',
                    ),
                  ),
                ],
              ),
              if (line.photos.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Carriers reject damage claims without photos.',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              const SizedBox(height: 8),
              TextField(
                controller: line.note,
                decoration: const InputDecoration(
                  labelText: 'Note (optional)',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({
    required this.label,
    required this.value,
    required this.onChanged,
    this.max,
  });

  final String label;
  final int value;
  final int? max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 90, child: Text(label)),
        IconButton.outlined(
          onPressed: value > 0 ? () => onChanged(value - 1) : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 48,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        IconButton.outlined(
          onPressed: max == null || value < max!
              ? () => onChanged(value + 1)
              : null,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
