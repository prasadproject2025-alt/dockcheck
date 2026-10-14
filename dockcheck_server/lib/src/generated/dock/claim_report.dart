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
import 'package:dockcheck_server/src/generated/protocol.dart' as _ivv4um1u;
import 'package:serverpod/serverpod.dart' as _is;
import '../dock/discrepancy.dart' as _iaklv62g;
import '../dock/shipment.dart' as _imqpmfqf;

/// Evidence pack the supervisor sends to the transport company.
abstract class ClaimReport
    implements _is.SerializableModel, _is.ProtocolSerialization {
  ClaimReport._({
    required this.shipment,
    required this.discrepancies,
    required this.photoUrls,
    required this.reportText,
    required this.generatedAt,
  });

  factory ClaimReport({
    required _imqpmfqf.Shipment shipment,
    required List<_iaklv62g.Discrepancy> discrepancies,
    required List<String> photoUrls,
    required String reportText,
    required DateTime generatedAt,
  }) = _ClaimReportImpl;

  factory ClaimReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return ClaimReport(
      shipment: _ivv4um1u.Protocol().deserialize<_imqpmfqf.Shipment>(
        jsonSerialization['shipment'],
      ),
      discrepancies: _ivv4um1u.Protocol()
          .deserialize<List<_iaklv62g.Discrepancy>>(
            jsonSerialization['discrepancies'],
          ),
      photoUrls: _ivv4um1u.Protocol().deserialize<List<String>>(
        jsonSerialization['photoUrls'],
      ),
      reportText: jsonSerialization['reportText'] as String,
      generatedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['generatedAt'],
      ),
    );
  }

  _imqpmfqf.Shipment shipment;

  List<_iaklv62g.Discrepancy> discrepancies;

  List<String> photoUrls;

  String reportText;

  DateTime generatedAt;

  /// Returns a shallow copy of this [ClaimReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ClaimReport copyWith({
    _imqpmfqf.Shipment? shipment,
    List<_iaklv62g.Discrepancy>? discrepancies,
    List<String>? photoUrls,
    String? reportText,
    DateTime? generatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClaimReport',
      'shipment': shipment.toJson(),
      'discrepancies': discrepancies.toJson(valueToJson: (v) => v.toJson()),
      'photoUrls': photoUrls.toJson(),
      'reportText': reportText,
      'generatedAt': generatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClaimReport',
      'shipment': shipment.toJsonForProtocol(),
      'discrepancies': discrepancies.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'photoUrls': photoUrls.toJson(),
      'reportText': reportText,
      'generatedAt': generatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _ClaimReportImpl extends ClaimReport {
  _ClaimReportImpl({
    required _imqpmfqf.Shipment shipment,
    required List<_iaklv62g.Discrepancy> discrepancies,
    required List<String> photoUrls,
    required String reportText,
    required DateTime generatedAt,
  }) : super._(
         shipment: shipment,
         discrepancies: discrepancies,
         photoUrls: photoUrls,
         reportText: reportText,
         generatedAt: generatedAt,
       );

  /// Returns a shallow copy of this [ClaimReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ClaimReport copyWith({
    _imqpmfqf.Shipment? shipment,
    List<_iaklv62g.Discrepancy>? discrepancies,
    List<String>? photoUrls,
    String? reportText,
    DateTime? generatedAt,
  }) {
    return ClaimReport(
      shipment: shipment ?? this.shipment.copyWith(),
      discrepancies:
          discrepancies ??
          this.discrepancies.map((e0) => e0.copyWith()).toList(),
      photoUrls: photoUrls ?? this.photoUrls.map((e0) => e0).toList(),
      reportText: reportText ?? this.reportText,
      generatedAt: generatedAt ?? this.generatedAt,
    );
  }
}
