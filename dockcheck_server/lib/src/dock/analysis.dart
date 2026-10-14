import '../generated/protocol.dart';

/// What the worker counted for one item, ready to be compared with the
/// expected quantity.
class ItemCount {
  ItemCount({
    required this.description,
    required this.expectedQty,
    required this.receivedQty,
    required this.damagedQty,
    required this.photoCount,
  });

  final String description;
  final int expectedQty;
  final int receivedQty;
  final int damagedQty;
  final int photoCount;
}

/// A mismatch found by [analyzeItems], before it is stored.
class DiscrepancyDraft {
  DiscrepancyDraft({
    required this.itemDescription,
    required this.kind,
    required this.quantity,
    required this.severity,
    required this.explanation,
  });

  final String itemDescription;
  final DiscrepancyKind kind;
  final int quantity;
  final int severity;
  final String explanation;
}

int _clamp(num value) => value.round().clamp(0, 100).toInt();

/// Compares received against expected quantities and scores each mismatch from
/// 0 to 100. The score grows with the share of the line that is affected, and
/// damage without photo evidence is flagged because carriers reject those
/// claims.
List<DiscrepancyDraft> analyzeItems(List<ItemCount> items) {
  final drafts = <DiscrepancyDraft>[];
  for (final item in items) {
    final expected = item.expectedQty <= 0 ? 1 : item.expectedQty;

    if (item.receivedQty < item.expectedQty) {
      final missing = item.expectedQty - item.receivedQty;
      final share = missing / expected;
      drafts.add(
        DiscrepancyDraft(
          itemDescription: item.description,
          kind: DiscrepancyKind.short,
          quantity: missing,
          severity: _clamp(40 + 60 * share),
          explanation:
              '$missing of ${item.expectedQty} missing '
              '(${(share * 100).round()}% of the line).',
        ),
      );
    } else if (item.receivedQty > item.expectedQty) {
      final extra = item.receivedQty - item.expectedQty;
      drafts.add(
        DiscrepancyDraft(
          itemDescription: item.description,
          kind: DiscrepancyKind.over,
          quantity: extra,
          severity: _clamp(15 + 25 * (extra / expected)),
          explanation: '$extra more than the ${item.expectedQty} expected.',
        ),
      );
    }

    if (item.damagedQty > 0) {
      final share = item.damagedQty / expected;
      final evidence = item.photoCount > 0
          ? '${item.photoCount} photo(s) attached.'
          : 'No photo evidence: the carrier may reject the claim.';
      drafts.add(
        DiscrepancyDraft(
          itemDescription: item.description,
          kind: DiscrepancyKind.damaged,
          quantity: item.damagedQty,
          severity: _clamp(35 + 65 * share + (item.photoCount > 0 ? 0 : 10)),
          explanation:
              '${item.damagedQty} of ${item.expectedQty} damaged '
              '(${(share * 100).round()}% of the line). $evidence',
        ),
      );
    }
  }
  return drafts;
}

/// The shipment-level severity: the worst single discrepancy.
int overallSeverity(List<DiscrepancyDraft> drafts) =>
    drafts.fold<int>(0, (worst, d) => d.severity > worst ? d.severity : worst);

/// Human-readable severity band for alert titles.
String severityLabel(int severity) {
  if (severity >= 70) return 'HIGH';
  if (severity >= 40) return 'MEDIUM';
  return 'LOW';
}
