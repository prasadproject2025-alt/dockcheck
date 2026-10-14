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
import 'package:dockcheck_server/src/generated/dock/discrepancy.dart'
    as _i8557xl8;
import 'package:dockcheck_server/src/generated/dock/dock_alert.dart'
    as _iy7rtp0n;
import 'package:dockcheck_server/src/generated/dock/shipment.dart' as _irgwkjh2;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
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

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'damage_photo',
      dartName: 'DamagePhoto',
      schema: 'public',
      module: 'dockcheck',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'itemId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'storagePath',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'takenAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'damage_photo_fk_0',
          columns: ['itemId'],
          referenceTable: 'shipment_item',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'discrepancy',
      dartName: 'Discrepancy',
      schema: 'public',
      module: 'dockcheck',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'shipmentId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'itemDescription',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'kind',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DiscrepancyKind',
        ),
        _isp.ColumnDefinition(
          name: 'quantity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'severity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'explanation',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'discrepancy_fk_0',
          columns: ['shipmentId'],
          referenceTable: 'shipment',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'discrepancy_shipment_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'shipmentId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'dock_alert',
      dartName: 'DockAlert',
      schema: 'public',
      module: 'dockcheck',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'shipmentId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'kind',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'message',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'severity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'readAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'dock_alert_created_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'shipment',
      dartName: 'Shipment',
      schema: 'public',
      module: 'dockcheck',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'reference',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'carrier',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ShipmentStatus',
          columnDefault: '\'expected\'',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'claimDeadline',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'createdByUserId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'receivedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'receivedByName',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'receiptId',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'shipment_status_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'shipment_item',
      dartName: 'ShipmentItem',
      schema: 'public',
      module: 'dockcheck',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'shipmentId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'expectedQty',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'receivedQty',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'damagedQty',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'note',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'shipment_item_fk_0',
          columns: ['shipmentId'],
          referenceTable: 'shipment',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'staff_profile',
      dartName: 'StaffProfile',
      schema: 'public',
      module: 'dockcheck',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'authUserId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'role',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:StaffRoleType',
        ),
        _isp.ColumnDefinition(
          name: 'displayName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'staff_profile_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

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
      } on _is.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _is.getType<_iggl9wmb.ClaimReport?>()) {
      return (data != null ? _iggl9wmb.ClaimReport.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iueazli7.DamagePhoto?>()) {
      return (data != null ? _iueazli7.DamagePhoto.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iwmg9rnz.Discrepancy?>()) {
      return (data != null ? _iwmg9rnz.Discrepancy.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iaksqru7.DiscrepancyKind?>()) {
      return (data != null ? _iaksqru7.DiscrepancyKind.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i8dofi2s.DockAlert?>()) {
      return (data != null ? _i8dofi2s.DockAlert.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ioyd9c1z.DockException?>()) {
      return (data != null ? _ioyd9c1z.DockException.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ifd2gbgd.NewShipment?>()) {
      return (data != null ? _ifd2gbgd.NewShipment.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_imnbdcmm.NewShipmentItem?>()) {
      return (data != null ? _imnbdcmm.NewShipmentItem.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_irvjjsdl.Receipt?>()) {
      return (data != null ? _irvjjsdl.Receipt.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i44oksso.ReceiptLine?>()) {
      return (data != null ? _i44oksso.ReceiptLine.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_irzxrm2n.Shipment?>()) {
      return (data != null ? _irzxrm2n.Shipment.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iorp8zwt.ShipmentItem?>()) {
      return (data != null ? _iorp8zwt.ShipmentItem.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i2slball.ShipmentStatus?>()) {
      return (data != null ? _i2slball.ShipmentStatus.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iwe6712p.StaffProfile?>()) {
      return (data != null ? _iwe6712p.StaffProfile.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i2osikpb.StaffRoleType?>()) {
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
    if (t == _is.getType<List<_iorp8zwt.ShipmentItem>?>()) {
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
    if (t == _is.getType<List<_iueazli7.DamagePhoto>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_iueazli7.DamagePhoto>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_iy7rtp0n.DockAlert>) {
      return (data as List)
              .map((e) => deserialize<_iy7rtp0n.DockAlert>(e))
              .toList()
          as T;
    }
    if (t == List<_irgwkjh2.Shipment>) {
      return (data as List)
              .map((e) => deserialize<_irgwkjh2.Shipment>(e))
              .toList()
          as T;
    }
    if (t == List<_i8557xl8.Discrepancy>) {
      return (data as List)
              .map((e) => deserialize<_i8557xl8.Discrepancy>(e))
              .toList()
          as T;
    }
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
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
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
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
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('dockcheck', this);
    _iacs.Protocol().registerHostProtocol('dockcheck', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _iueazli7.DamagePhoto:
        return _iueazli7.DamagePhoto.t;
      case _iwmg9rnz.Discrepancy:
        return _iwmg9rnz.Discrepancy.t;
      case _i8dofi2s.DockAlert:
        return _i8dofi2s.DockAlert.t;
      case _irzxrm2n.Shipment:
        return _irzxrm2n.Shipment.t;
      case _iorp8zwt.ShipmentItem:
        return _iorp8zwt.ShipmentItem.t;
      case _iwe6712p.StaffProfile:
        return _iwe6712p.StaffProfile.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

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
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
