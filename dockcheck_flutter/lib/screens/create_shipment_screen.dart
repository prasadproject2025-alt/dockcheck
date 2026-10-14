import 'package:dockcheck_client/dockcheck_client.dart';
import 'package:flutter/material.dart';

import '../client.dart';
import '../state/dock_store.dart';
import '../widgets/common.dart';

/// Supervisor registers a delivery they expect, with the quantities per line.
class CreateShipmentScreen extends StatefulWidget {
  const CreateShipmentScreen({super.key});

  @override
  State<CreateShipmentScreen> createState() => _CreateShipmentScreenState();
}

class _ItemRow {
  _ItemRow(String description, String qty)
    : description = TextEditingController(text: description),
      qty = TextEditingController(text: qty);

  final TextEditingController description;
  final TextEditingController qty;

  void dispose() {
    description.dispose();
    qty.dispose();
  }
}

class _CreateShipmentScreenState extends State<CreateShipmentScreen> {
  final _reference = TextEditingController(text: 'MH-12-4410');
  final _carrier = TextEditingController(text: 'Blue Dart');
  final _window = TextEditingController(text: '48');
  final List<_ItemRow> _rows = [
    _ItemRow('Carton A', '40'),
    _ItemRow('Mattress', '10'),
  ];
  bool _busy = false;

  @override
  void dispose() {
    _reference.dispose();
    _carrier.dispose();
    _window.dispose();
    for (final r in _rows) {
      r.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final items = <NewShipmentItem>[];
    for (final r in _rows) {
      final description = r.description.text.trim();
      final qty = int.tryParse(r.qty.text.trim());
      if (description.isEmpty || qty == null || qty <= 0) {
        showMessage(
          context,
          'Every line needs a name and a quantity above zero.',
          error: true,
        );
        return;
      }
      items.add(NewShipmentItem(description: description, expectedQty: qty));
    }
    final hours = int.tryParse(_window.text.trim());
    if (hours == null || hours <= 0) {
      showMessage(context, 'Enter the claim window in hours.', error: true);
      return;
    }

    setState(() => _busy = true);
    try {
      await client.shipment.createShipment(
        NewShipment(
          reference: _reference.text,
          carrier: _carrier.text,
          claimWindowHours: hours,
          items: items,
        ),
      );
      await store.refresh();
      if (!mounted) return;
      Navigator.of(context).pop();
      showMessage(context, 'Shipment is now expected at the dock.');
    } catch (e) {
      if (mounted) {
        showMessage(
          context,
          e is DockException
              ? e.message
              : 'Creating a shipment needs a connection.',
          error: true,
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expect a shipment')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _reference,
            decoration: const InputDecoration(
              labelText: 'Truck / reference',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _carrier,
            decoration: const InputDecoration(
              labelText: 'Transport company',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _window,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Claim window (hours)',
              helperText: 'How long the carrier accepts damage claims.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Expected items',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < _rows.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _rows[i].description,
                      decoration: const InputDecoration(
                        labelText: 'Item',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _rows[i].qty,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Qty',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Remove',
                    onPressed: _rows.length == 1
                        ? null
                        : () => setState(() => _rows.removeAt(i).dispose()),
                    icon: const Icon(Icons.delete_outline),
                  ),
                ],
              ),
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => setState(() => _rows.add(_ItemRow('', '1'))),
              icon: const Icon(Icons.add),
              label: const Text('Add item'),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _busy ? null : _save,
            child: _busy
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Create shipment'),
          ),
        ],
      ),
    );
  }
}
