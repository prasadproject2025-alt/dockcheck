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
import 'dart:typed_data' as _idt;
import 'package:dockcheck_server/src/generated/protocol.dart' as _ivv4um1u;
import 'package:serverpod/serverpod.dart' as _is;

/// Counted quantities for a single shipment item.
abstract class ReceiptLine
    implements _is.SerializableModel, _is.ProtocolSerialization {
  ReceiptLine._({
    required this.shipmentItemId,
    required this.receivedQty,
    required this.damagedQty,
    this.note,
    required this.photos,
  });

  factory ReceiptLine({
    required int shipmentItemId,
    required int receivedQty,
    required int damagedQty,
    String? note,
    required List<_idt.ByteData> photos,
  }) = _ReceiptLineImpl;

  factory ReceiptLine.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReceiptLine(
      shipmentItemId: jsonSerialization['shipmentItemId'] as int,
      receivedQty: jsonSerialization['receivedQty'] as int,
      damagedQty: jsonSerialization['damagedQty'] as int,
      note: jsonSerialization['note'] as String?,
      photos: _ivv4um1u.Protocol().deserialize<List<_idt.ByteData>>(
        jsonSerialization['photos'],
      ),
    );
  }

  int shipmentItemId;

  int receivedQty;

  int damagedQty;

  String? note;

  List<_idt.ByteData> photos;

  /// Returns a shallow copy of this [ReceiptLine]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ReceiptLine copyWith({
    int? shipmentItemId,
    int? receivedQty,
    int? damagedQty,
    String? note,
    List<_idt.ByteData>? photos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReceiptLine',
      'shipmentItemId': shipmentItemId,
      'receivedQty': receivedQty,
      'damagedQty': damagedQty,
      if (note != null) 'note': note,
      'photos': photos.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ReceiptLine',
      'shipmentItemId': shipmentItemId,
      'receivedQty': receivedQty,
      'damagedQty': damagedQty,
      if (note != null) 'note': note,
      'photos': photos.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReceiptLineImpl extends ReceiptLine {
  _ReceiptLineImpl({
    required int shipmentItemId,
    required int receivedQty,
    required int damagedQty,
    String? note,
    required List<_idt.ByteData> photos,
  }) : super._(
         shipmentItemId: shipmentItemId,
         receivedQty: receivedQty,
         damagedQty: damagedQty,
         note: note,
         photos: photos,
       );

  /// Returns a shallow copy of this [ReceiptLine]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ReceiptLine copyWith({
    int? shipmentItemId,
    int? receivedQty,
    int? damagedQty,
    Object? note = _Undefined,
    List<_idt.ByteData>? photos,
  }) {
    return ReceiptLine(
      shipmentItemId: shipmentItemId ?? this.shipmentItemId,
      receivedQty: receivedQty ?? this.receivedQty,
      damagedQty: damagedQty ?? this.damagedQty,
      note: note is String? ? note : this.note,
      photos: photos ?? this.photos.map((e0) => e0.clone()).toList(),
    );
  }
}
