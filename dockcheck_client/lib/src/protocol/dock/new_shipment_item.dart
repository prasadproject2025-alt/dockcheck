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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

/// One expected line in a [NewShipment].
abstract class NewShipmentItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  NewShipmentItem._({
    required this.description,
    required this.expectedQty,
  });

  factory NewShipmentItem({
    required String description,
    required int expectedQty,
  }) = _NewShipmentItemImpl;

  factory NewShipmentItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return NewShipmentItem(
      description: jsonSerialization['description'] as String,
      expectedQty: jsonSerialization['expectedQty'] as int,
    );
  }

  String description;

  int expectedQty;

  /// Returns a shallow copy of this [NewShipmentItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  NewShipmentItem copyWith({
    String? description,
    int? expectedQty,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NewShipmentItem',
      'description': description,
      'expectedQty': expectedQty,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NewShipmentItem',
      'description': description,
      'expectedQty': expectedQty,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _NewShipmentItemImpl extends NewShipmentItem {
  _NewShipmentItemImpl({
    required String description,
    required int expectedQty,
  }) : super._(
         description: description,
         expectedQty: expectedQty,
       );

  /// Returns a shallow copy of this [NewShipmentItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  NewShipmentItem copyWith({
    String? description,
    int? expectedQty,
  }) {
    return NewShipmentItem(
      description: description ?? this.description,
      expectedQty: expectedQty ?? this.expectedQty,
    );
  }
}
