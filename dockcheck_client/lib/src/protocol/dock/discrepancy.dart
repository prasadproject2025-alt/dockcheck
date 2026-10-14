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
import '../dock/discrepancy_kind.dart' as _i8x9h4pu;

/// A mismatch found by the server when comparing expected and received.
abstract class Discrepancy
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Discrepancy._({
    this.id,
    required this.shipmentId,
    required this.itemDescription,
    required this.kind,
    required this.quantity,
    required this.severity,
    required this.explanation,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Discrepancy({
    int? id,
    required int shipmentId,
    required String itemDescription,
    required _i8x9h4pu.DiscrepancyKind kind,
    required int quantity,
    required int severity,
    required String explanation,
    DateTime? createdAt,
  }) = _DiscrepancyImpl;

  factory Discrepancy.fromJson(Map<String, dynamic> jsonSerialization) {
    return Discrepancy(
      id: jsonSerialization['id'] as int?,
      shipmentId: jsonSerialization['shipmentId'] as int,
      itemDescription: jsonSerialization['itemDescription'] as String,
      kind: _i8x9h4pu.DiscrepancyKind.fromJson(
        (jsonSerialization['kind'] as String),
      ),
      quantity: jsonSerialization['quantity'] as int,
      severity: jsonSerialization['severity'] as int,
      explanation: jsonSerialization['explanation'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int shipmentId;

  String itemDescription;

  _i8x9h4pu.DiscrepancyKind kind;

  int quantity;

  /// 0-100, computed on the server.
  int severity;

  String explanation;

  DateTime createdAt;

  /// Returns a shallow copy of this [Discrepancy]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Discrepancy copyWith({
    int? id,
    int? shipmentId,
    String? itemDescription,
    _i8x9h4pu.DiscrepancyKind? kind,
    int? quantity,
    int? severity,
    String? explanation,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Discrepancy',
      if (id != null) 'id': id,
      'shipmentId': shipmentId,
      'itemDescription': itemDescription,
      'kind': kind.toJson(),
      'quantity': quantity,
      'severity': severity,
      'explanation': explanation,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Discrepancy',
      if (id != null) 'id': id,
      'shipmentId': shipmentId,
      'itemDescription': itemDescription,
      'kind': kind.toJson(),
      'quantity': quantity,
      'severity': severity,
      'explanation': explanation,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DiscrepancyImpl extends Discrepancy {
  _DiscrepancyImpl({
    int? id,
    required int shipmentId,
    required String itemDescription,
    required _i8x9h4pu.DiscrepancyKind kind,
    required int quantity,
    required int severity,
    required String explanation,
    DateTime? createdAt,
  }) : super._(
         id: id,
         shipmentId: shipmentId,
         itemDescription: itemDescription,
         kind: kind,
         quantity: quantity,
         severity: severity,
         explanation: explanation,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Discrepancy]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Discrepancy copyWith({
    Object? id = _Undefined,
    int? shipmentId,
    String? itemDescription,
    _i8x9h4pu.DiscrepancyKind? kind,
    int? quantity,
    int? severity,
    String? explanation,
    DateTime? createdAt,
  }) {
    return Discrepancy(
      id: id is int? ? id : this.id,
      shipmentId: shipmentId ?? this.shipmentId,
      itemDescription: itemDescription ?? this.itemDescription,
      kind: kind ?? this.kind,
      quantity: quantity ?? this.quantity,
      severity: severity ?? this.severity,
      explanation: explanation ?? this.explanation,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
