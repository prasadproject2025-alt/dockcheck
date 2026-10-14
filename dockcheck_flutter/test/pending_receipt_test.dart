import 'dart:convert';
import 'dart:typed_data';

import 'package:dockcheck_flutter/state/dock_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PendingReceipt', () {
    final receipt = PendingReceipt(
      receiptId: 'r-1',
      shipmentId: 7,
      recordedAt: DateTime.utc(2026, 10, 14, 12),
      lines: [
        PendingLine(
          shipmentItemId: 3,
          receivedQty: 38,
          damagedQty: 1,
          note: 'corner crushed',
          photos: [
            Uint8List.fromList([1, 2, 3]),
          ],
        ),
        PendingLine(shipmentItemId: 4, receivedQty: 10, damagedQty: 0),
      ],
    );

    test('survives being saved to the phone and read back', () {
      final restored = PendingReceipt.fromJson(
        jsonDecode(jsonEncode(receipt.toJson())) as Map<String, dynamic>,
      );

      expect(restored.receiptId, 'r-1');
      expect(restored.shipmentId, 7);
      expect(restored.recordedAt, receipt.recordedAt);
      expect(restored.lines, hasLength(2));
      expect(restored.lines.first.note, 'corner crushed');
      expect(restored.lines.first.photos.single, [1, 2, 3]);
      expect(restored.lines.last.photos, isEmpty);
    });

    test('keeps the same receipt id when converted for the server', () {
      final first = receipt.toReceipt();
      final second = receipt.toReceipt();
      expect(first.receiptId, second.receiptId);
      expect(first.lines.first.photos.single.lengthInBytes, 3);
    });
  });

  test('every new receipt gets a different id', () {
    final ids = {for (var i = 0; i < 200; i++) newReceiptId()};
    expect(ids, hasLength(200));
  });
}
