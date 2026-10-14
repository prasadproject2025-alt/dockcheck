/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dockcheck_server/src/generated/protocol.dart' as _ivv4um1u;
import 'package:serverpod/serverpod.dart' as _is;
import '../dock/shipment_item.dart' as _iqjjt2qt;
import '../dock/shipment_status.dart' as _iinzfezm;

/// An inbound delivery the supervisor expects at the dock.
abstract class Shipment
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
    required _is.UuidValue createdByUserId,
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
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      claimDeadline: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['claimDeadline'],
      ),
      createdByUserId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['createdByUserId'],
      ),
      receivedAt: jsonSerialization['receivedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['receivedAt']),
      receivedByName: jsonSerialization['receivedByName'] as String?,
      receiptId: jsonSerialization['receiptId'] as String?,
      items: jsonSerialization['items'] == null
          ? null
          : _ivv4um1u.Protocol().deserialize<List<_iqjjt2qt.ShipmentItem>>(
              jsonSerialization['items'],
            ),
    );
  }

  static final t = ShipmentTable();

  static const db = ShipmentRepository._();

  @override
  int? id;

  String reference;

  String carrier;

  _iinzfezm.ShipmentStatus status;

  DateTime createdAt;

  /// Transporters only accept damage claims until this moment.
  DateTime claimDeadline;

  _is.UuidValue createdByUserId;

  DateTime? receivedAt;

  String? receivedByName;

  /// Id of the receipt that was accepted, used to ignore duplicate syncs.
  String? receiptId;

  List<_iqjjt2qt.ShipmentItem>? items;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Shipment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Shipment copyWith({
    int? id,
    String? reference,
    String? carrier,
    _iinzfezm.ShipmentStatus? status,
    DateTime? createdAt,
    DateTime? claimDeadline,
    _is.UuidValue? createdByUserId,
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

  static ShipmentInclude include({_iqjjt2qt.ShipmentItemIncludeList? items}) {
    return ShipmentInclude._(items: items);
  }

  static ShipmentIncludeList includeList({
    _is.WhereExpressionBuilder<ShipmentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShipmentTable>? orderBy,
    _is.OrderByListBuilder<ShipmentTable>? orderByList,
    ShipmentInclude? include,
  }) {
    return ShipmentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Shipment.t),
      orderByList: orderByList?.call(Shipment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
    required _is.UuidValue createdByUserId,
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
  @_is.useResult
  @override
  Shipment copyWith({
    Object? id = _Undefined,
    String? reference,
    String? carrier,
    _iinzfezm.ShipmentStatus? status,
    DateTime? createdAt,
    DateTime? claimDeadline,
    _is.UuidValue? createdByUserId,
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

class ShipmentUpdateTable extends _is.UpdateTable<ShipmentTable> {
  ShipmentUpdateTable(super.table);

  _is.ColumnValue<String, String> reference(String value) => _is.ColumnValue(
    table.reference,
    value,
  );

  _is.ColumnValue<String, String> carrier(String value) => _is.ColumnValue(
    table.carrier,
    value,
  );

  _is.ColumnValue<_iinzfezm.ShipmentStatus, _iinzfezm.ShipmentStatus> status(
    _iinzfezm.ShipmentStatus value,
  ) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> claimDeadline(DateTime value) =>
      _is.ColumnValue(
        table.claimDeadline,
        value,
      );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> createdByUserId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.createdByUserId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> receivedAt(DateTime? value) =>
      _is.ColumnValue(
        table.receivedAt,
        value,
      );

  _is.ColumnValue<String, String> receivedByName(String? value) =>
      _is.ColumnValue(
        table.receivedByName,
        value,
      );

  _is.ColumnValue<String, String> receiptId(String? value) => _is.ColumnValue(
    table.receiptId,
    value,
  );
}

class ShipmentTable extends _is.Table<int?> {
  ShipmentTable({super.tableRelation}) : super(tableName: 'shipment') {
    updateTable = ShipmentUpdateTable(this);
    reference = _is.ColumnString(
      'reference',
      this,
    );
    carrier = _is.ColumnString(
      'carrier',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
      hasDefault: true,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    claimDeadline = _is.ColumnDateTime(
      'claimDeadline',
      this,
    );
    createdByUserId = _is.ColumnUuid(
      'createdByUserId',
      this,
    );
    receivedAt = _is.ColumnDateTime(
      'receivedAt',
      this,
    );
    receivedByName = _is.ColumnString(
      'receivedByName',
      this,
    );
    receiptId = _is.ColumnString(
      'receiptId',
      this,
    );
  }

  late final ShipmentUpdateTable updateTable;

  late final _is.ColumnString reference;

  late final _is.ColumnString carrier;

  late final _is.ColumnEnum<_iinzfezm.ShipmentStatus> status;

  late final _is.ColumnDateTime createdAt;

  /// Transporters only accept damage claims until this moment.
  late final _is.ColumnDateTime claimDeadline;

  late final _is.ColumnUuid createdByUserId;

  late final _is.ColumnDateTime receivedAt;

  late final _is.ColumnString receivedByName;

  /// Id of the receipt that was accepted, used to ignore duplicate syncs.
  late final _is.ColumnString receiptId;

  _iqjjt2qt.ShipmentItemTable? ___items;

  _is.ManyRelation<_iqjjt2qt.ShipmentItemTable>? _items;

  _iqjjt2qt.ShipmentItemTable get __items {
    if (___items != null) return ___items!;
    ___items = _is.createRelationTable(
      relationFieldName: '__items',
      field: Shipment.t.id,
      foreignField: _iqjjt2qt.ShipmentItem.t.shipmentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _iqjjt2qt.ShipmentItemTable(tableRelation: foreignTableRelation),
    );
    return ___items!;
  }

  _is.ManyRelation<_iqjjt2qt.ShipmentItemTable> get items {
    if (_items != null) return _items!;
    var relationTable = _is.createRelationTable(
      relationFieldName: 'items',
      field: Shipment.t.id,
      foreignField: _iqjjt2qt.ShipmentItem.t.shipmentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _iqjjt2qt.ShipmentItemTable(tableRelation: foreignTableRelation),
    );
    _items = _is.ManyRelation<_iqjjt2qt.ShipmentItemTable>(
      tableWithRelations: relationTable,
      table: _iqjjt2qt.ShipmentItemTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _items!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    reference,
    carrier,
    status,
    createdAt,
    claimDeadline,
    createdByUserId,
    receivedAt,
    receivedByName,
    receiptId,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'items') {
      return __items;
    }
    return null;
  }
}

class ShipmentInclude extends _is.IncludeObject {
  ShipmentInclude._({_iqjjt2qt.ShipmentItemIncludeList? items}) {
    _items = items;
  }

  _iqjjt2qt.ShipmentItemIncludeList? _items;

  @override
  Map<String, _is.Include?> get includes => {'items': _items};

  @override
  _is.Table<int?> get table => Shipment.t;
}

class ShipmentIncludeList extends _is.IncludeList {
  ShipmentIncludeList._({
    _is.WhereExpressionBuilder<ShipmentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Shipment.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Shipment.t;
}

class ShipmentRepository {
  const ShipmentRepository._();

  final attach = const ShipmentAttachRepository._();

  final attachRow = const ShipmentAttachRowRepository._();

  /// Returns a list of [Shipment]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Shipment>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShipmentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShipmentTable>? orderBy,
    _is.OrderByListBuilder<ShipmentTable>? orderByList,
    _is.Transaction? transaction,
    ShipmentInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Shipment>(
      where: where?.call(Shipment.t),
      orderBy: orderBy?.call(Shipment.t),
      orderByList: orderByList?.call(Shipment.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Shipment] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Shipment?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShipmentTable>? where,
    int? offset,
    _is.OrderByBuilder<ShipmentTable>? orderBy,
    _is.OrderByListBuilder<ShipmentTable>? orderByList,
    _is.Transaction? transaction,
    ShipmentInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Shipment>(
      where: where?.call(Shipment.t),
      orderBy: orderBy?.call(Shipment.t),
      orderByList: orderByList?.call(Shipment.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Shipment] by its [id] or null if no such row exists.
  Future<Shipment?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    ShipmentInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Shipment>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Shipment]s in the list and returns the inserted rows.
  ///
  /// The returned [Shipment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Shipment>> insert(
    _is.DatabaseSession session,
    List<Shipment> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Shipment>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Shipment] and returns the inserted row.
  ///
  /// The returned [Shipment] will have its `id` field set.
  Future<Shipment> insertRow(
    _is.DatabaseSession session,
    Shipment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Shipment>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Shipment]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [Shipment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Shipment>> upsert(
    _is.DatabaseSession session,
    List<Shipment> rows, {
    required _is.ColumnSelections<ShipmentTable> conflictColumns,
    _is.ColumnSelections<ShipmentTable>? updateColumns,
    _is.WhereExpressionBuilder<ShipmentTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Shipment>(
      rows,
      conflictColumns: conflictColumns(Shipment.t),
      updateColumns: updateColumns?.call(Shipment.t),
      updateWhere: updateWhere?.call(Shipment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Shipment] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [Shipment] will have its `id` field set.
  Future<Shipment?> upsertRow(
    _is.DatabaseSession session,
    Shipment row, {
    required _is.ColumnSelections<ShipmentTable> conflictColumns,
    _is.ColumnSelections<ShipmentTable>? updateColumns,
    _is.WhereExpressionBuilder<ShipmentTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Shipment>(
      row,
      conflictColumns: conflictColumns(Shipment.t),
      updateColumns: updateColumns?.call(Shipment.t),
      updateWhere: updateWhere?.call(Shipment.t),
      transaction: transaction,
    );
  }

  /// Updates all [Shipment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Shipment>> update(
    _is.DatabaseSession session,
    List<Shipment> rows, {
    _is.ColumnSelections<ShipmentTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Shipment>(
      rows,
      columns: columns?.call(Shipment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Shipment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Shipment> updateRow(
    _is.DatabaseSession session,
    Shipment row, {
    _is.ColumnSelections<ShipmentTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Shipment>(
      row,
      columns: columns?.call(Shipment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Shipment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Shipment?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ShipmentUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Shipment>(
      id,
      columnValues: columnValues(Shipment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Shipment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Shipment>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ShipmentUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ShipmentTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShipmentTable>? orderBy,
    _is.OrderByListBuilder<ShipmentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Shipment>(
      columnValues: columnValues(Shipment.t.updateTable),
      where: where(Shipment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Shipment.t),
      orderByList: orderByList?.call(Shipment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Shipment]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Shipment>> delete(
    _is.DatabaseSession session,
    List<Shipment> rows, {
    _is.OrderByBuilder<ShipmentTable>? orderBy,
    _is.OrderByListBuilder<ShipmentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Shipment>(
      rows,
      orderBy: orderBy?.call(Shipment.t),
      orderByList: orderByList?.call(Shipment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Shipment].
  Future<Shipment> deleteRow(
    _is.DatabaseSession session,
    Shipment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Shipment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Shipment>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ShipmentTable> where,
    _is.OrderByBuilder<ShipmentTable>? orderBy,
    _is.OrderByListBuilder<ShipmentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Shipment>(
      where: where(Shipment.t),
      orderBy: orderBy?.call(Shipment.t),
      orderByList: orderByList?.call(Shipment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShipmentTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Shipment>(
      where: where?.call(Shipment.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Shipment] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ShipmentTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Shipment>(
      where: where(Shipment.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class ShipmentAttachRepository {
  const ShipmentAttachRepository._();

  /// Creates a relation between this [Shipment] and the given [ShipmentItem]s
  /// by setting each [ShipmentItem]'s foreign key `shipmentId` to refer to this [Shipment].
  Future<void> items(
    _is.DatabaseSession session,
    Shipment shipment,
    List<_iqjjt2qt.ShipmentItem> shipmentItem, {
    _is.Transaction? transaction,
  }) async {
    if (shipmentItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('shipmentItem.id');
    }
    if (shipment.id == null) {
      throw ArgumentError.notNull('shipment.id');
    }

    var $shipmentItem = shipmentItem
        .map((e) => e.copyWith(shipmentId: shipment.id))
        .toList();
    await session.db.update<_iqjjt2qt.ShipmentItem>(
      $shipmentItem,
      columns: [_iqjjt2qt.ShipmentItem.t.shipmentId],
      transaction: transaction,
    );
  }
}

class ShipmentAttachRowRepository {
  const ShipmentAttachRowRepository._();

  /// Creates a relation between this [Shipment] and the given [ShipmentItem]
  /// by setting the [ShipmentItem]'s foreign key `shipmentId` to refer to this [Shipment].
  Future<void> items(
    _is.DatabaseSession session,
    Shipment shipment,
    _iqjjt2qt.ShipmentItem shipmentItem, {
    _is.Transaction? transaction,
  }) async {
    if (shipmentItem.id == null) {
      throw ArgumentError.notNull('shipmentItem.id');
    }
    if (shipment.id == null) {
      throw ArgumentError.notNull('shipment.id');
    }

    var $shipmentItem = shipmentItem.copyWith(shipmentId: shipment.id);
    await session.db.updateRow<_iqjjt2qt.ShipmentItem>(
      $shipmentItem,
      columns: [_iqjjt2qt.ShipmentItem.t.shipmentId],
      transaction: transaction,
    );
  }
}
