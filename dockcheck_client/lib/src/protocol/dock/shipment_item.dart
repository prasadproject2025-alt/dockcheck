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
import '../dock/damage_photo.dart' as _ii3dpnte;
import '../dock/shipment.dart' as _imqpmfqf;

/// One expected line on a shipment, plus what the worker actually counted.
abstract class ShipmentItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ShipmentItem._({
    this.id,
    required this.shipmentId,
    this.shipment,
    required this.description,
    required this.expectedQty,
    this.receivedQty,
    int? damagedQty,
    this.note,
    this.photos,
  }) : damagedQty = damagedQty ?? 0;

  factory ShipmentItem({
    int? id,
    required int shipmentId,
    _imqpmfqf.Shipment? shipment,
    required String description,
    required int expectedQty,
    int? receivedQty,
    int? damagedQty,
    String? note,
    List<_ii3dpnte.DamagePhoto>? photos,
  }) = _ShipmentItemImpl;

  factory ShipmentItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return ShipmentItem(
      id: jsonSerialization['id'] as int?,
      shipmentId: jsonSerialization['shipmentId'] as int,
      shipment: jsonSerialization['shipment'] == null
          ? null
          : _ivi5l4b1.Protocol().deserialize<_imqpmfqf.Shipment>(
              jsonSerialization['shipment'],
            ),
      description: jsonSerialization['description'] as String,
      expectedQty: jsonSerialization['expectedQty'] as int,
      receivedQty: jsonSerialization['receivedQty'] as int?,
      damagedQty: jsonSerialization['damagedQty'] as int?,
      note: jsonSerialization['note'] as String?,
      photos: jsonSerialization['photos'] == null
          ? null
          : _ivi5l4b1.Protocol().deserialize<List<_ii3dpnte.DamagePhoto>>(
              jsonSerialization['photos'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int shipmentId;

  _imqpmfqf.Shipment? shipment;

  String description;

  int expectedQty;

  int? receivedQty;

  int damagedQty;

  String? note;

  List<_ii3dpnte.DamagePhoto>? photos;

  /// Returns a shallow copy of this [ShipmentItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ShipmentItem copyWith({
    int? id,
    int? shipmentId,
    _imqpmfqf.Shipment? shipment,
    String? description,
    int? expectedQty,
    int? receivedQty,
    int? damagedQty,
    String? note,
    List<_ii3dpnte.DamagePhoto>? photos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ShipmentItem',
      if (id != null) 'id': id,
      'shipmentId': shipmentId,
      if (shipment != null) 'shipment': shipment?.toJson(),
      'description': description,
      'expectedQty': expectedQty,
      if (receivedQty != null) 'receivedQty': receivedQty,
      'damagedQty': damagedQty,
      if (note != null) 'note': note,
      if (photos != null)
        'photos': photos?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ShipmentItem',
      if (id != null) 'id': id,
      'shipmentId': shipmentId,
      if (shipment != null) 'shipment': shipment?.toJsonForProtocol(),
      'description': description,
      'expectedQty': expectedQty,
      if (receivedQty != null) 'receivedQty': receivedQty,
      'damagedQty': damagedQty,
      if (note != null) 'note': note,
      if (photos != null)
        'photos': photos?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShipmentItemImpl extends ShipmentItem {
  _ShipmentItemImpl({
    int? id,
    required int shipmentId,
    _imqpmfqf.Shipment? shipment,
    required String description,
    required int expectedQty,
    int? receivedQty,
    int? damagedQty,
    String? note,
    List<_ii3dpnte.DamagePhoto>? photos,
  }) : super._(
         id: id,
         shipmentId: shipmentId,
         shipment: shipment,
         description: description,
         expectedQty: expectedQty,
         receivedQty: receivedQty,
         damagedQty: damagedQty,
         note: note,
         photos: photos,
       );

  /// Returns a shallow copy of this [ShipmentItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ShipmentItem copyWith({
    Object? id = _Undefined,
    int? shipmentId,
    Object? shipment = _Undefined,
    String? description,
    int? expectedQty,
    Object? receivedQty = _Undefined,
    int? damagedQty,
    Object? note = _Undefined,
    Object? photos = _Undefined,
  }) {
    return ShipmentItem(
      id: id is int? ? id : this.id,
      shipmentId: shipmentId ?? this.shipmentId,
      shipment: shipment is _imqpmfqf.Shipment?
          ? shipment
          : this.shipment?.copyWith(),
      description: description ?? this.description,
      expectedQty: expectedQty ?? this.expectedQty,
      receivedQty: receivedQty is int? ? receivedQty : this.receivedQty,
      damagedQty: damagedQty ?? this.damagedQty,
      note: note is String? ? note : this.note,
      photos: photos is List<_ii3dpnte.DamagePhoto>?
          ? photos
          : this.photos?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
