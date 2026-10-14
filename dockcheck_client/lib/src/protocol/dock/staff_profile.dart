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
import '../dock/staff_role.dart' as _iyzfzxxu;

/// Maps an authenticated user to their dock role.
abstract class StaffProfile
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  StaffProfile._({
    this.id,
    required this.authUserId,
    required this.role,
    required this.displayName,
  });

  factory StaffProfile({
    int? id,
    required _isc.UuidValue authUserId,
    required _iyzfzxxu.StaffRoleType role,
    required String displayName,
  }) = _StaffProfileImpl;

  factory StaffProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return StaffProfile(
      id: jsonSerialization['id'] as int?,
      authUserId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      role: _iyzfzxxu.StaffRoleType.fromJson(
        (jsonSerialization['role'] as String),
      ),
      displayName: jsonSerialization['displayName'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _isc.UuidValue authUserId;

  _iyzfzxxu.StaffRoleType role;

  String displayName;

  /// Returns a shallow copy of this [StaffProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  StaffProfile copyWith({
    int? id,
    _isc.UuidValue? authUserId,
    _iyzfzxxu.StaffRoleType? role,
    String? displayName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StaffProfile',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'role': role.toJson(),
      'displayName': displayName,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StaffProfile',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'role': role.toJson(),
      'displayName': displayName,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StaffProfileImpl extends StaffProfile {
  _StaffProfileImpl({
    int? id,
    required _isc.UuidValue authUserId,
    required _iyzfzxxu.StaffRoleType role,
    required String displayName,
  }) : super._(
         id: id,
         authUserId: authUserId,
         role: role,
         displayName: displayName,
       );

  /// Returns a shallow copy of this [StaffProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  StaffProfile copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? authUserId,
    _iyzfzxxu.StaffRoleType? role,
    String? displayName,
  }) {
    return StaffProfile(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      role: role ?? this.role,
      displayName: displayName ?? this.displayName,
    );
  }
}
