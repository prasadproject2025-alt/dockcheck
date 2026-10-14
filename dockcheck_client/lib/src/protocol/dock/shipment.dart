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
import '../dock/shipment_item.dart' as _iqjjt2qt;
import '../dock/shipment_status.dart' as _iinzfezm;

/// An inbound delivery the supervisor expects at the dock.
abstract class Shipment
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Shipment._({
    this.id,
    required this.reference,
    required this.carrier,
    _iinzfezm.ShipmentStatus? status,
    DateTime? createdAt,
    required this.claimDeadline,
    required this.createdByUserId,
    this.receivedAt,
    this.receivedByName,
    this.receiptId,
    this.items,
  }) : status = status ?? _iinzfezm.ShipmentStatus.expected,
       createdAt = createdAt ?? DateTime.now();

  factory Shipment({
    int? id,
    required String reference,
    required String carrier,
    _iinzfezm.ShipmentStatus? status,
    DateTime? createdAt,
    required DateTime claimDeadline,
    required _isc.UuidValue createdByUserId,
    DateTime? receivedAt,
    String? receivedByName,
    String? receiptId,
    List<_iqjjt2qt.ShipmentItem>? items,
  }) = _ShipmentImpl;

  factory Shipment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Shipment(
      id: jsonSerialization['id'] as int?,
      reference: jsonSerialization['reference'] as String,
      carrier: jsonSerialization['carrier'] as String,
      status: jsonSerialization['status'] == null
          ? null
          : _iinzfezm.ShipmentStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      claimDeadline: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['claimDeadline'],
      ),
      createdByUserId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['createdByUserId'],
      ),
      receivedAt: jsonSerialization['receivedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['receivedAt'],
            ),
      receivedByName: jsonSerialization['receivedByName'] as String?,
      receiptId: jsonSerialization['receiptId'] as String?,
      items: jsonSerialization['items'] == null
          ? null
          : _ivi5l4b1.Protocol().deserialize<List<_iqjjt2qt.ShipmentItem>>(
              jsonSerialization['items'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String reference;

  String carrier;

  _iinzfezm.ShipmentStatus status;

  DateTime createdAt;

  /// Transporters only accept damage claims until this moment.
  DateTime claimDeadline;

  _isc.UuidValue createdByUserId;

  DateTime? receivedAt;

  String? receivedByName;

  /// Id of the receipt that was accepted, used to ignore duplicate syncs.
  String? receiptId;

  List<_iqjjt2qt.ShipmentItem>? items;

  /// Returns a shallow copy of this [Shipment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Shipment copyWith({
    int? id,
    String? reference,
    String? carrier,
    _iinzfezm.ShipmentStatus? status,
    DateTime? createdAt,
    DateTime? claimDeadline,
    _isc.UuidValue? createdByUserId,
    DateTime? receivedAt,
    String? receivedByName,
    String? receiptId,
    List<_iqjjt2qt.ShipmentItem>? items,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Shipment',
      if (id != null) 'id': id,
      'reference': reference,
      'carrier': carrier,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      'claimDeadline': claimDeadline.toJson(),
      'createdByUserId': createdByUserId.toJson(),
      if (receivedAt != null) 'receivedAt': receivedAt?.toJson(),
      if (receivedByName != null) 'receivedByName': receivedByName,
      if (receiptId != null) 'receiptId': receiptId,
      if (items != null) 'items': items?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Shipment',
      if (id != null) 'id': id,
      'reference': reference,
      'carrier': carrier,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      'claimDeadline': claimDeadline.toJson(),
      'createdByUserId': createdByUserId.toJson(),
      if (receivedAt != null) 'receivedAt': receivedAt?.toJson(),
      if (receivedByName != null) 'receivedByName': receivedByName,
      if (receiptId != null) 'receiptId': receiptId,
      if (items != null)
        'items': items?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShipmentImpl extends Shipment {
  _ShipmentImpl({
    int? id,
    required String reference,
    required String carrier,
    _iinzfezm.ShipmentStatus? status,
    DateTime? createdAt,
    required DateTime claimDeadline,
    required _isc.UuidValue createdByUserId,
    DateTime? receivedAt,
    String? receivedByName,
    String? receiptId,
    List<_iqjjt2qt.ShipmentItem>? items,
  }) : super._(
         id: id,
         reference: reference,
         carrier: carrier,
         status: status,
         createdAt: createdAt,
         claimDeadline: claimDeadline,
         createdByUserId: createdByUserId,
         receivedAt: receivedAt,
         receivedByName: receivedByName,
         receiptId: receiptId,
         items: items,
       );

  /// Returns a shallow copy of this [Shipment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Shipment copyWith({
    Object? id = _Undefined,
    String? reference,
    String? carrier,
    _iinzfezm.ShipmentStatus? status,
    DateTime? createdAt,
    DateTime? claimDeadline,
    _isc.UuidValue? createdByUserId,
    Object? receivedAt = _Undefined,
    Object? receivedByName = _Undefined,
    Object? receiptId = _Undefined,
    Object? items = _Undefined,
  }) {
    return Shipment(
      id: id is int? ? id : this.id,
      reference: reference ?? this.reference,
      carrier: carrier ?? this.carrier,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      claimDeadline: claimDeadline ?? this.claimDeadline,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      receivedAt: receivedAt is DateTime? ? receivedAt : this.receivedAt,
      receivedByName: receivedByName is String?
          ? receivedByName
          : this.receivedByName,
      receiptId: receiptId is String? ? receiptId : this.receiptId,
      items: items is List<_iqjjt2qt.ShipmentItem>?
          ? items
          : this.items?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
