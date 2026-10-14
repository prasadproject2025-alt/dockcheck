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

/// Business-rule failures that the client can show to the user.
abstract class DockException
    implements
        _isc.SerializableException,
        _isc.SerializableModel,
        _isc.ProtocolSerialization {
  DockException._({required this.message});

  factory DockException({required String message}) = _DockExceptionImpl;

  factory DockException.fromJson(Map<String, dynamic> jsonSerialization) {
    return DockException(message: jsonSerialization['message'] as String);
  }

  String message;

  /// Returns a shallow copy of this [DockException]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  DockException copyWith({String? message});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DockException',
      'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DockException',
      'message': message,
    };
  }

  @override
  String toString() {
    return 'DockException(message: $message)';
  }
}

class _DockExceptionImpl extends DockException {
  _DockExceptionImpl({required String message}) : super._(message: message);

  /// Returns a shallow copy of this [DockException]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  DockException copyWith({String? message}) {
    return DockException(message: message ?? this.message);
  }
}
