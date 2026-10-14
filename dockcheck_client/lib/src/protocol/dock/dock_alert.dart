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

/// Notification for supervisors. Persisted so offline supervisors still see it,
/// and pushed live over a stream.
abstract class DockAlert
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  DockAlert._({
    this.id,
    required this.shipmentId,
    required this.kind,
    required this.title,
    required this.message,
    required this.severity,
    DateTime? createdAt,
    this.readAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory DockAlert({
    int? id,
    required int shipmentId,
    required String kind,
    required String title,
    required String message,
    required int severity,
    DateTime? createdAt,
    DateTime? readAt,
  }) = _DockAlertImpl;

  factory DockAlert.fromJson(Map<String, dynamic> jsonSerialization) {
    return DockAlert(
      id: jsonSerialization['id'] as int?,
      shipmentId: jsonSerialization['shipmentId'] as int,
      kind: jsonSerialization['kind'] as String,
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      severity: jsonSerialization['severity'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int shipmentId;

  String kind;

  String title;

  String message;

  int severity;

  DateTime createdAt;

  DateTime? readAt;

  /// Returns a shallow copy of this [DockAlert]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  DockAlert copyWith({
    int? id,
    int? shipmentId,
    String? kind,
    String? title,
    String? message,
    int? severity,
    DateTime? createdAt,
    DateTime? readAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DockAlert',
      if (id != null) 'id': id,
      'shipmentId': shipmentId,
      'kind': kind,
      'title': title,
      'message': message,
      'severity': severity,
      'createdAt': createdAt.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DockAlert',
      if (id != null) 'id': id,
      'shipmentId': shipmentId,
      'kind': kind,
      'title': title,
      'message': message,
      'severity': severity,
      'createdAt': createdAt.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DockAlertImpl extends DockAlert {
  _DockAlertImpl({
    int? id,
    required int shipmentId,
    required String kind,
    required String title,
    required String message,
    required int severity,
    DateTime? createdAt,
    DateTime? readAt,
  }) : super._(
         id: id,
         shipmentId: shipmentId,
         kind: kind,
         title: title,
         message: message,
         severity: severity,
         createdAt: createdAt,
         readAt: readAt,
       );

  /// Returns a shallow copy of this [DockAlert]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  DockAlert copyWith({
    Object? id = _Undefined,
    int? shipmentId,
    String? kind,
    String? title,
    String? message,
    int? severity,
    DateTime? createdAt,
    Object? readAt = _Undefined,
  }) {
    return DockAlert(
      id: id is int? ? id : this.id,
      shipmentId: shipmentId ?? this.shipmentId,
      kind: kind ?? this.kind,
      title: title ?? this.title,
      message: message ?? this.message,
      severity: severity ?? this.severity,
      createdAt: createdAt ?? this.createdAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
    );
  }
}
