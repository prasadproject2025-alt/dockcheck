/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _idt;
import 'package:dockcheck_client/src/protocol/dock/discrepancy.dart'
    as _iuqcwwxd;
import 'package:dockcheck_client/src/protocol/dock/dock_alert.dart'
    as _ijkcww34;
import 'package:dockcheck_client/src/protocol/dock/shipment.dart' as _ikb66t34;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'dock/claim_report.dart' as _iggl9wmb;
import 'dock/damage_photo.dart' as _iueazli7;
import 'dock/discrepancy.dart' as _iwmg9rnz;
import 'dock/discrepancy_kind.dart' as _iaksqru7;
import 'dock/dock_alert.dart' as _i8dofi2s;
import 'dock/dock_exception.dart' as _ioyd9c1z;
import 'dock/new_shipment.dart' as _ifd2gbgd;
import 'dock/new_shipment_item.dart' as _imnbdcmm;
import 'dock/receipt.dart' as _irvjjsdl;
import 'dock/receipt_line.dart' as _i44oksso;
import 'dock/shipment.dart' as _irzxrm2n;
import 'dock/shipment_item.dart' as _iorp8zwt;
import 'dock/shipment_status.dart' as _i2slball;
import 'dock/staff_profile.dart' as _iwe6712p;
import 'dock/staff_role.dart' as _i2osikpb;
export 'dock/claim_report.dart';
export 'dock/damage_photo.dart';
export 'dock/discrepancy.dart';
export 'dock/discrepancy_kind.dart';
export 'dock/dock_alert.dart';
export 'dock/dock_exception.dart';
export 'dock/new_shipment.dart';
export 'dock/new_shipment_item.dart';
export 'dock/receipt.dart';
export 'dock/receipt_line.dart';
export 'dock/shipment.dart';
export 'dock/shipment_item.dart';
export 'dock/shipment_status.dart';
export 'dock/staff_profile.dart';
export 'dock/staff_role.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _iggl9wmb.ClaimReport) {
      return _iggl9wmb.ClaimReport.fromJson(data) as T;
    }
    if (t == _iueazli7.DamagePhoto) {
      return _iueazli7.DamagePhoto.fromJson(data) as T;
    }
    if (t == _iwmg9rnz.Discrepancy) {
      return _iwmg9rnz.Discrepancy.fromJson(data) as T;
    }
    if (t == _iaksqru7.DiscrepancyKind) {
      return _iaksqru7.DiscrepancyKind.fromJson(data) as T;
    }
    if (t == _i8dofi2s.DockAlert) {
      return _i8dofi2s.DockAlert.fromJson(data) as T;
    }
    if (t == _ioyd9c1z.DockException) {
      return _ioyd9c1z.DockException.fromJson(data) as T;
    }
    if (t == _ifd2gbgd.NewShipment) {
      return _ifd2gbgd.NewShipment.fromJson(data) as T;
    }
    if (t == _imnbdcmm.NewShipmentItem) {
      return _imnbdcmm.NewShipmentItem.fromJson(data) as T;
    }
    if (t == _irvjjsdl.Receipt) {
      return _irvjjsdl.Receipt.fromJson(data) as T;
    }
    if (t == _i44oksso.ReceiptLine) {
      return _i44oksso.ReceiptLine.fromJson(data) as T;
    }
    if (t == _irzxrm2n.Shipment) {
      return _irzxrm2n.Shipment.fromJson(data) as T;
    }
    if (t == _iorp8zwt.ShipmentItem) {
      return _iorp8zwt.ShipmentItem.fromJson(data) as T;
    }
    if (t == _i2slball.ShipmentStatus) {
      return _i2slball.ShipmentStatus.fromJson(data) as T;
    }
    if (t == _iwe6712p.StaffProfile) {
      return _iwe6712p.StaffProfile.fromJson(data) as T;
    }
    if (t == _i2osikpb.StaffRoleType) {
      return _i2osikpb.StaffRoleType.fromJson(data) as T;
    }
    if (t == _isc.getType<_iggl9wmb.ClaimReport?>()) {
      return (data != null ? _iggl9wmb.ClaimReport.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iueazli7.DamagePhoto?>()) {
      return (data != null ? _iueazli7.DamagePhoto.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iwmg9rnz.Discrepancy?>()) {
      return (data != null ? _iwmg9rnz.Discrepancy.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iaksqru7.DiscrepancyKind?>()) {
      return (data != null ? _iaksqru7.DiscrepancyKind.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i8dofi2s.DockAlert?>()) {
      return (data != null ? _i8dofi2s.DockAlert.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ioyd9c1z.DockException?>()) {
      return (data != null ? _ioyd9c1z.DockException.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ifd2gbgd.NewShipment?>()) {
      return (data != null ? _ifd2gbgd.NewShipment.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_imnbdcmm.NewShipmentItem?>()) {
      return (data != null ? _imnbdcmm.NewShipmentItem.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_irvjjsdl.Receipt?>()) {
      return (data != null ? _irvjjsdl.Receipt.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i44oksso.ReceiptLine?>()) {
      return (data != null ? _i44oksso.ReceiptLine.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_irzxrm2n.Shipment?>()) {
      return (data != null ? _irzxrm2n.Shipment.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iorp8zwt.ShipmentItem?>()) {
      return (data != null ? _iorp8zwt.ShipmentItem.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i2slball.ShipmentStatus?>()) {
      return (data != null ? _i2slball.ShipmentStatus.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iwe6712p.StaffProfile?>()) {
      return (data != null ? _iwe6712p.StaffProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i2osikpb.StaffRoleType?>()) {
      return (data != null ? _i2osikpb.StaffRoleType.fromJson(data) : null)
          as T;
    }
    if (t == List<_iwmg9rnz.Discrepancy>) {
      return (data as List)
              .map((e) => deserialize<_iwmg9rnz.Discrepancy>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_imnbdcmm.NewShipmentItem>) {
      return (data as List)
              .map((e) => deserialize<_imnbdcmm.NewShipmentItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i44oksso.ReceiptLine>) {
      return (data as List)
              .map((e) => deserialize<_i44oksso.ReceiptLine>(e))
              .toList()
          as T;
    }
    if (t == List<_idt.ByteData>) {
      return (data as List).map((e) => deserialize<_idt.ByteData>(e)).toList()
          as T;
    }
    if (t == List<_iorp8zwt.ShipmentItem>) {
      return (data as List)
              .map((e) => deserialize<_iorp8zwt.ShipmentItem>(e))
              .toList()
          as T;
    }
    if (t == _isc.getType<List<_iorp8zwt.ShipmentItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_iorp8zwt.ShipmentItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_iueazli7.DamagePhoto>) {
      return (data as List)
              .map((e) => deserialize<_iueazli7.DamagePhoto>(e))
              .toList()
          as T;
    }
    if (t == _isc.getType<List<_iueazli7.DamagePhoto>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_iueazli7.DamagePhoto>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_ijkcww34.DockAlert>) {
      return (data as List)
              .map((e) => deserialize<_ijkcww34.DockAlert>(e))
              .toList()
          as T;
    }
    if (t == List<_ikb66t34.Shipment>) {
      return (data as List)
              .map((e) => deserialize<_ikb66t34.Shipment>(e))
              .toList()
          as T;
    }
    if (t == List<_iuqcwwxd.Discrepancy>) {
      return (data as List)
              .map((e) => deserialize<_iuqcwwxd.Discrepancy>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _iggl9wmb.ClaimReport => 'ClaimReport',
      _iueazli7.DamagePhoto => 'DamagePhoto',
      _iwmg9rnz.Discrepancy => 'Discrepancy',
      _iaksqru7.DiscrepancyKind => 'DiscrepancyKind',
      _i8dofi2s.DockAlert => 'DockAlert',
      _ioyd9c1z.DockException => 'DockException',
      _ifd2gbgd.NewShipment => 'NewShipment',
      _imnbdcmm.NewShipmentItem => 'NewShipmentItem',
      _irvjjsdl.Receipt => 'Receipt',
      _i44oksso.ReceiptLine => 'ReceiptLine',
      _irzxrm2n.Shipment => 'Shipment',
      _iorp8zwt.ShipmentItem => 'ShipmentItem',
      _i2slball.ShipmentStatus => 'ShipmentStatus',
      _iwe6712p.StaffProfile => 'StaffProfile',
      _i2osikpb.StaffRoleType => 'StaffRoleType',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('dockcheck.', '');
    }

    switch (data) {
      case _iggl9wmb.ClaimReport():
        return 'ClaimReport';
      case _iueazli7.DamagePhoto():
        return 'DamagePhoto';
      case _iwmg9rnz.Discrepancy():
        return 'Discrepancy';
      case _iaksqru7.DiscrepancyKind():
        return 'DiscrepancyKind';
      case _i8dofi2s.DockAlert():
        return 'DockAlert';
      case _ioyd9c1z.DockException():
        return 'DockException';
      case _ifd2gbgd.NewShipment():
        return 'NewShipment';
      case _imnbdcmm.NewShipmentItem():
        return 'NewShipmentItem';
      case _irvjjsdl.Receipt():
        return 'Receipt';
      case _i44oksso.ReceiptLine():
        return 'ReceiptLine';
      case _irzxrm2n.Shipment():
        return 'Shipment';
      case _iorp8zwt.ShipmentItem():
        return 'ShipmentItem';
      case _i2slball.ShipmentStatus():
        return 'ShipmentStatus';
      case _iwe6712p.StaffProfile():
        return 'StaffProfile';
      case _i2osikpb.StaffRoleType():
        return 'StaffRoleType';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ClaimReport') {
      return deserialize<_iggl9wmb.ClaimReport>(data['data']);
    }
    if (dataClassName == 'DamagePhoto') {
      return deserialize<_iueazli7.DamagePhoto>(data['data']);
    }
    if (dataClassName == 'Discrepancy') {
      return deserialize<_iwmg9rnz.Discrepancy>(data['data']);
    }
    if (dataClassName == 'DiscrepancyKind') {
      return deserialize<_iaksqru7.DiscrepancyKind>(data['data']);
    }
    if (dataClassName == 'DockAlert') {
      return deserialize<_i8dofi2s.DockAlert>(data['data']);
    }
    if (dataClassName == 'DockException') {
      return deserialize<_ioyd9c1z.DockException>(data['data']);
    }
    if (dataClassName == 'NewShipment') {
      return deserialize<_ifd2gbgd.NewShipment>(data['data']);
    }
    if (dataClassName == 'NewShipmentItem') {
      return deserialize<_imnbdcmm.NewShipmentItem>(data['data']);
    }
    if (dataClassName == 'Receipt') {
      return deserialize<_irvjjsdl.Receipt>(data['data']);
    }
    if (dataClassName == 'ReceiptLine') {
      return deserialize<_i44oksso.ReceiptLine>(data['data']);
    }
    if (dataClassName == 'Shipment') {
      return deserialize<_irzxrm2n.Shipment>(data['data']);
    }
    if (dataClassName == 'ShipmentItem') {
      return deserialize<_iorp8zwt.ShipmentItem>(data['data']);
    }
    if (dataClassName == 'ShipmentStatus') {
      return deserialize<_i2slball.ShipmentStatus>(data['data']);
    }
    if (dataClassName == 'StaffProfile') {
      return deserialize<_iwe6712p.StaffProfile>(data['data']);
    }
    if (dataClassName == 'StaffRoleType') {
      return deserialize<_i2osikpb.StaffRoleType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('dockcheck', this);
    _iacc.Protocol().registerHostProtocol('dockcheck', this);
  }

  @override
  String getModuleName() => 'dockcheck';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
