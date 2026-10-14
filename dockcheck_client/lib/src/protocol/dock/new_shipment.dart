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
import '../dock/new_shipment_item.dart' as _ie6jq1nv;

/// Supervisor input for creating an expected shipment.
abstract class NewShipment
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  NewShipment._({
    required this.reference,
    required this.carrier,
    required this.claimWindowHours,
    required this.items,
  });

  factory NewShipment({
    required String reference,
    required String carrier,
    required int claimWindowHours,
    required List<_ie6jq1nv.NewShipmentItem> items,
  }) = _NewShipmentImpl;

  factory NewShipment.fromJson(Map<String, dynamic> jsonSerialization) {
    return NewShipment(
      reference: jsonSerialization['reference'] as String,
      carrier: jsonSerialization['carrier'] as String,
      claimWindowHours: jsonSerialization['claimWindowHours'] as int,
      items: _ivi5l4b1.Protocol().deserialize<List<_ie6jq1nv.NewShipmentItem>>(
        jsonSerialization['items'],
      ),
    );
  }

  String reference;

  String carrier;

  /// Hours after arrival during which the carrier accepts damage claims.
  int claimWindowHours;

  List<_ie6jq1nv.NewShipmentItem> items;

  /// Returns a shallow copy of this [NewShipment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  NewShipment copyWith({
    String? reference,
    String? carrier,
    int? claimWindowHours,
    List<_ie6jq1nv.NewShipmentItem>? items,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NewShipment',
      'reference': reference,
      'carrier': carrier,
      'claimWindowHours': claimWindowHours,
      'items': items.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NewShipment',
      'reference': reference,
      'carrier': carrier,
      'claimWindowHours': claimWindowHours,
      'items': items.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _NewShipmentImpl extends NewShipment {
  _NewShipmentImpl({
    required String reference,
    required String carrier,
    required int claimWindowHours,
    required List<_ie6jq1nv.NewShipmentItem> items,
  }) : super._(
         reference: reference,
         carrier: carrier,
         claimWindowHours: claimWindowHours,
         items: items,
       );

  /// Returns a shallow copy of this [NewShipment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  NewShipment copyWith({
    String? reference,
    String? carrier,
    int? claimWindowHours,
    List<_ie6jq1nv.NewShipmentItem>? items,
  }) {
    return NewShipment(
      reference: reference ?? this.reference,
      carrier: carrier ?? this.carrier,
      claimWindowHours: claimWindowHours ?? this.claimWindowHours,
      items: items ?? this.items.map((e0) => e0.copyWith()).toList(),
    );
  }
}
