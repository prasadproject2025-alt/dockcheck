/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dockcheck_client/src/protocol/protocol.dart' as _ivi5l4b1;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../dock/receipt_line.dart' as _ivmerx5p;

/// What the worker submits (possibly long after it was recorded offline).
abstract class Receipt
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Receipt._({
    required this.receiptId,
    required this.shipmentId,
    required this.recordedAt,
    required this.lines,
  });

  factory Receipt({
    required String receiptId,
    required int shipmentId,
    required DateTime recordedAt,
    required List<_ivmerx5p.ReceiptLine> lines,
  }) = _ReceiptImpl;

  factory Receipt.fromJson(Map<String, dynamic> jsonSerialization) {
    return Receipt(
      receiptId: jsonSerialization['receiptId'] as String,
      shipmentId: jsonSerialization['shipmentId'] as int,
      recordedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['recordedAt'],
      ),
      lines: _ivi5l4b1.Protocol().deserialize<List<_ivmerx5p.ReceiptLine>>(
        jsonSerialization['lines'],
      ),
    );
  }

  /// Client-generated id. Making the call idempotent lets the queue retry safely.
  String receiptId;

  int shipmentId;

  DateTime recordedAt;

  List<_ivmerx5p.ReceiptLine> lines;

  /// Returns a shallow copy of this [Receipt]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Receipt copyWith({
    String? receiptId,
    int? shipmentId,
    DateTime? recordedAt,
    List<_ivmerx5p.ReceiptLine>? lines,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Receipt',
      'receiptId': receiptId,
      'shipmentId': shipmentId,
      'recordedAt': recordedAt.toJson(),
      'lines': lines.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Receipt',
      'receiptId': receiptId,
      'shipmentId': shipmentId,
      'recordedAt': recordedAt.toJson(),
      'lines': lines.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _ReceiptImpl extends Receipt {
  _ReceiptImpl({
    required String receiptId,
    required int shipmentId,
    required DateTime recordedAt,
    required List<_ivmerx5p.ReceiptLine> lines,
  }) : super._(
         receiptId: receiptId,
         shipmentId: shipmentId,
         recordedAt: recordedAt,
         lines: lines,
       );

  /// Returns a shallow copy of this [Receipt]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Receipt copyWith({
    String? receiptId,
    int? shipmentId,
    DateTime? recordedAt,
    List<_ivmerx5p.ReceiptLine>? lines,
  }) {
    return Receipt(
      receiptId: receiptId ?? this.receiptId,
      shipmentId: shipmentId ?? this.shipmentId,
      recordedAt: recordedAt ?? this.recordedAt,
      lines: lines ?? this.lines.map((e0) => e0.copyWith()).toList(),
    );
  }
}
