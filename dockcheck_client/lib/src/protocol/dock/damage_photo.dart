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

/// Photo evidence of damage, stored in Serverpod file storage.
abstract class DamagePhoto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  DamagePhoto._({
    this.id,
    required this.itemId,
    this.item,
    required this.storagePath,
    DateTime? takenAt,
    this.url,
  }) : takenAt = takenAt ?? DateTime.now();

  factory DamagePhoto({
    int? id,
    required int itemId,
    _iqjjt2qt.ShipmentItem? item,
    required String storagePath,
    DateTime? takenAt,
    String? url,
  }) = _DamagePhotoImpl;

  factory DamagePhoto.fromJson(Map<String, dynamic> jsonSerialization) {
    return DamagePhoto(
      id: jsonSerialization['id'] as int?,
      itemId: jsonSerialization['itemId'] as int,
      item: jsonSerialization['item'] == null
          ? null
          : _ivi5l4b1.Protocol().deserialize<_iqjjt2qt.ShipmentItem>(
              jsonSerialization['item'],
            ),
      storagePath: jsonSerialization['storagePath'] as String,
      takenAt: jsonSerialization['takenAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['takenAt']),
      url: jsonSerialization['url'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int itemId;

  _iqjjt2qt.ShipmentItem? item;

  String storagePath;

  DateTime takenAt;

  /// Public download URL, filled in on read (not stored).
  String? url;

  /// Returns a shallow copy of this [DamagePhoto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  DamagePhoto copyWith({
    int? id,
    int? itemId,
    _iqjjt2qt.ShipmentItem? item,
    String? storagePath,
    DateTime? takenAt,
    String? url,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DamagePhoto',
      if (id != null) 'id': id,
      'itemId': itemId,
      if (item != null) 'item': item?.toJson(),
      'storagePath': storagePath,
      'takenAt': takenAt.toJson(),
      if (url != null) 'url': url,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DamagePhoto',
      if (id != null) 'id': id,
      'itemId': itemId,
      if (item != null) 'item': item?.toJsonForProtocol(),
      'storagePath': storagePath,
      'takenAt': takenAt.toJson(),
      if (url != null) 'url': url,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DamagePhotoImpl extends DamagePhoto {
  _DamagePhotoImpl({
    int? id,
    required int itemId,
    _iqjjt2qt.ShipmentItem? item,
    required String storagePath,
    DateTime? takenAt,
    String? url,
  }) : super._(
         id: id,
         itemId: itemId,
         item: item,
         storagePath: storagePath,
         takenAt: takenAt,
         url: url,
       );

  /// Returns a shallow copy of this [DamagePhoto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  DamagePhoto copyWith({
    Object? id = _Undefined,
    int? itemId,
    Object? item = _Undefined,
    String? storagePath,
    DateTime? takenAt,
    Object? url = _Undefined,
  }) {
    return DamagePhoto(
      id: id is int? ? id : this.id,
      itemId: itemId ?? this.itemId,
      item: item is _iqjjt2qt.ShipmentItem? ? item : this.item?.copyWith(),
      storagePath: storagePath ?? this.storagePath,
      takenAt: takenAt ?? this.takenAt,
      url: url is String? ? url : this.url,
    );
  }
}
