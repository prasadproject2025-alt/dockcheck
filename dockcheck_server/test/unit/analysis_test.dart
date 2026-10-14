import 'package:dockcheck_server/src/dock/analysis.dart';
import 'package:dockcheck_server/src/generated/protocol.dart';
import 'package:test/test.dart';

ItemCount item({
  int expected = 40,
  int received = 40,
  int damaged = 0,
  int photos = 0,
}) => ItemCount(
  description: 'Carton A',
  expectedQty: expected,
  receivedQty: received,
  damagedQty: damaged,
  photoCount: photos,
);

void main() {
  group('analyzeItems', () {
    test('a perfect delivery has no discrepancies', () {
      expect(analyzeItems([item()]), isEmpty);
    });

    test('flags a shortage and scores it by the share missing', () {
      final result = analyzeItems([item(received: 38)]);
      expect(result, hasLength(1));
      expect(result.single.kind, DiscrepancyKind.short);
      expect(result.single.quantity, 2);
      expect(result.single.severity, inInclusiveRange(40, 50));
    });

    test('a fully missing line is the worst shortage', () {
      final result = analyzeItems([item(received: 0)]);
      expect(result.single.severity, 100);
    });

    test('flags damage and keeps it separate from the shortage', () {
      final result = analyzeItems([
        item(received: 38, damaged: 1, photos: 1),
      ]);
      expect(
        result.map((d) => d.kind),
        containsAll([DiscrepancyKind.short, DiscrepancyKind.damaged]),
      );
    });

    test('damage without photos scores higher and warns about evidence', () {
      final withPhoto = analyzeItems([item(damaged: 4, photos: 2)]).single;
      final without = analyzeItems([item(damaged: 4)]).single;
      expect(without.severity, greaterThan(withPhoto.severity));
      expect(without.explanation, contains('No photo evidence'));
    });

    test('extra items are low severity', () {
      final result = analyzeItems([item(received: 42)]);
      expect(result.single.kind, DiscrepancyKind.over);
      expect(result.single.severity, lessThan(40));
    });

    test('severity never leaves 0-100', () {
      final result = analyzeItems([item(expected: 1, received: 0, damaged: 0)]);
      expect(result.single.severity, lessThanOrEqualTo(100));
    });
  });

  group('overallSeverity', () {
    test('is zero when nothing is wrong', () {
      expect(overallSeverity([]), 0);
    });

    test('is the worst single discrepancy', () {
      final drafts = analyzeItems([
        item(received: 39),
        item(received: 0),
      ]);
      expect(overallSeverity(drafts), 100);
    });
  });

  test('severityLabel bands', () {
    expect(severityLabel(90), 'HIGH');
    expect(severityLabel(50), 'MEDIUM');
    expect(severityLabel(10), 'LOW');
  });
}
