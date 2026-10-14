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
import '../dock/damage_photo.dart' as _ii3dpnte;
import '../dock/shipment.dart' as _imqpmfqf;

/// One expected line on a shipment, plus what the worker actually counted.
abstract class ShipmentItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  ShipmentItem._({
    this.id,
    required this.shipmentId,
    this.shipment,
    required this.description,
    required this.expectedQty,
    this.receivedQty,
    int? damagedQty,
    this.note,
    this.photos,
  }) : damagedQty = damagedQty ?? 0;

  factory ShipmentItem({
    int? id,
    required int shipmentId,
    _imqpmfqf.Shipment? shipment,
    required String description,
    required int expectedQty,
    int? receivedQty,
    int? damagedQty,
    String? note,
    List<_ii3dpnte.DamagePhoto>? photos,
  }) = _ShipmentItemImpl;

  factory ShipmentItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return ShipmentItem(
      id: jsonSerialization['id'] as int?,
      shipmentId: jsonSerialization['shipmentId'] as int,
      shipment: jsonSerialization['shipment'] == null
          ? null
          : _ivv4um1u.Protocol().deserialize<_imqpmfqf.Shipment>(
              jsonSerialization['shipment'],
            ),
      description: jsonSerialization['description'] as String,
      expectedQty: jsonSerialization['expectedQty'] as int,
      receivedQty: jsonSerialization['receivedQty'] as int?,
      damagedQty: jsonSerialization['damagedQty'] as int?,
      note: jsonSerialization['note'] as String?,
      photos: jsonSerialization['photos'] == null
          ? null
          : _ivv4um1u.Protocol().deserialize<List<_ii3dpnte.DamagePhoto>>(
              jsonSerialization['photos'],
            ),
    );
  }

  static final t = ShipmentItemTable();

  static const db = ShipmentItemRepository._();

  @override
  int? id;

  int shipmentId;

  _imqpmfqf.Shipment? shipment;

  String description;

  int expectedQty;

  int? receivedQty;

  int damagedQty;

  String? note;

  List<_ii3dpnte.DamagePhoto>? photos;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ShipmentItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ShipmentItem copyWith({
    int? id,
    int? shipmentId,
    _imqpmfqf.Shipment? shipment,
    String? description,
    int? expectedQty,
    int? receivedQty,
    int? damagedQty,
    String? note,
    List<_ii3dpnte.DamagePhoto>? photos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ShipmentItem',
      if (id != null) 'id': id,
      'shipmentId': shipmentId,
      if (shipment != null) 'shipment': shipment?.toJson(),
      'description': description,
      'expectedQty': expectedQty,
      if (receivedQty != null) 'receivedQty': receivedQty,
      'damagedQty': damagedQty,
      if (note != null) 'note': note,
      if (photos != null)
        'photos': photos?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ShipmentItem',
      if (id != null) 'id': id,
      'shipmentId': shipmentId,
      if (shipment != null) 'shipment': shipment?.toJsonForProtocol(),
      'description': description,
      'expectedQty': expectedQty,
      if (receivedQty != null) 'receivedQty': receivedQty,
      'damagedQty': damagedQty,
      if (note != null) 'note': note,
      if (photos != null)
        'photos': photos?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static ShipmentItemInclude include({
    _imqpmfqf.ShipmentInclude? shipment,
    _ii3dpnte.DamagePhotoIncludeList? photos,
  }) {
    return ShipmentItemInclude._(
      shipment: shipment,
      photos: photos,
    );
  }

  static ShipmentItemIncludeList includeList({
    _is.WhereExpressionBuilder<ShipmentItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShipmentItemTable>? orderBy,
    _is.OrderByListBuilder<ShipmentItemTable>? orderByList,
    ShipmentItemInclude? include,
  }) {
    return ShipmentItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ShipmentItem.t),
      orderByList: orderByList?.call(ShipmentItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShipmentItemImpl extends ShipmentItem {
  _ShipmentItemImpl({
    int? id,
    required int shipmentId,
    _imqpmfqf.Shipment? shipment,
    required String description,
    required int expectedQty,
    int? receivedQty,
    int? damagedQty,
    String? note,
    List<_ii3dpnte.DamagePhoto>? photos,
  }) : super._(
         id: id,
         shipmentId: shipmentId,
         shipment: shipment,
         description: description,
         expectedQty: expectedQty,
         receivedQty: receivedQty,
         damagedQty: damagedQty,
         note: note,
         photos: photos,
       );

  /// Returns a shallow copy of this [ShipmentItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ShipmentItem copyWith({
    Object? id = _Undefined,
    int? shipmentId,
    Object? shipment = _Undefined,
    String? description,
    int? expectedQty,
    Object? receivedQty = _Undefined,
    int? damagedQty,
    Object? note = _Undefined,
    Object? photos = _Undefined,
  }) {
    return ShipmentItem(
      id: id is int? ? id : this.id,
      shipmentId: shipmentId ?? this.shipmentId,
      shipment: shipment is _imqpmfqf.Shipment?
          ? shipment
          : this.shipment?.copyWith(),
      description: description ?? this.description,
      expectedQty: expectedQty ?? this.expectedQty,
      receivedQty: receivedQty is int? ? receivedQty : this.receivedQty,
      damagedQty: damagedQty ?? this.damagedQty,
      note: note is String? ? note : this.note,
      photos: photos is List<_ii3dpnte.DamagePhoto>?
          ? photos
          : this.photos?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class ShipmentItemUpdateTable extends _is.UpdateTable<ShipmentItemTable> {
  ShipmentItemUpdateTable(super.table);

  _is.ColumnValue<int, int> shipmentId(int value) => _is.ColumnValue(
    table.shipmentId,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<int, int> expectedQty(int value) => _is.ColumnValue(
    table.expectedQty,
    value,
  );

  _is.ColumnValue<int, int> receivedQty(int? value) => _is.ColumnValue(
    table.receivedQty,
    value,
  );

  _is.ColumnValue<int, int> damagedQty(int value) => _is.ColumnValue(
    table.damagedQty,
    value,
  );

  _is.ColumnValue<String, String> note(String? value) => _is.ColumnValue(
    table.note,
    value,
  );
}

class ShipmentItemTable extends _is.Table<int?> {
  ShipmentItemTable({super.tableRelation}) : super(tableName: 'shipment_item') {
    updateTable = ShipmentItemUpdateTable(this);
    shipmentId = _is.ColumnInt(
      'shipmentId',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    expectedQty = _is.ColumnInt(
      'expectedQty',
      this,
    );
    receivedQty = _is.ColumnInt(
      'receivedQty',
      this,
    );
    damagedQty = _is.ColumnInt(
      'damagedQty',
      this,
      hasDefault: true,
    );
    note = _is.ColumnString(
      'note',
      this,
    );
  }

  late final ShipmentItemUpdateTable updateTable;

  late final _is.ColumnInt shipmentId;

  _imqpmfqf.ShipmentTable? _shipment;

  late final _is.ColumnString description;

  late final _is.ColumnInt expectedQty;

  late final _is.ColumnInt receivedQty;

  late final _is.ColumnInt damagedQty;

  late final _is.ColumnString note;

  _ii3dpnte.DamagePhotoTable? ___photos;

  _is.ManyRelation<_ii3dpnte.DamagePhotoTable>? _photos;

  _imqpmfqf.ShipmentTable get shipment {
    if (_shipment != null) return _shipment!;
    _shipment = _is.createRelationTable(
      relationFieldName: 'shipment',
      field: ShipmentItem.t.shipmentId,
      foreignField: _imqpmfqf.Shipment.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _imqpmfqf.ShipmentTable(tableRelation: foreignTableRelation),
    );
    return _shipment!;
  }

  _ii3dpnte.DamagePhotoTable get __photos {
    if (___photos != null) return ___photos!;
    ___photos = _is.createRelationTable(
      relationFieldName: '__photos',
      field: ShipmentItem.t.id,
      foreignField: _ii3dpnte.DamagePhoto.t.itemId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ii3dpnte.DamagePhotoTable(tableRelation: foreignTableRelation),
    );
    return ___photos!;
  }

  _is.ManyRelation<_ii3dpnte.DamagePhotoTable> get photos {
    if (_photos != null) return _photos!;
    var relationTable = _is.createRelationTable(
      relationFieldName: 'photos',
      field: ShipmentItem.t.id,
      foreignField: _ii3dpnte.DamagePhoto.t.itemId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ii3dpnte.DamagePhotoTable(tableRelation: foreignTableRelation),
    );
    _photos = _is.ManyRelation<_ii3dpnte.DamagePhotoTable>(
      tableWithRelations: relationTable,
      table: _ii3dpnte.DamagePhotoTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _photos!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    shipmentId,
    description,
    expectedQty,
    receivedQty,
    damagedQty,
    note,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'shipment') {
      return shipment;
    }
    if (relationField == 'photos') {
      return __photos;
    }
    return null;
  }
}

class ShipmentItemInclude extends _is.IncludeObject {
  ShipmentItemInclude._({
    _imqpmfqf.ShipmentInclude? shipment,
    _ii3dpnte.DamagePhotoIncludeList? photos,
  }) {
    _shipment = shipment;
    _photos = photos;
  }

  _imqpmfqf.ShipmentInclude? _shipment;

  _ii3dpnte.DamagePhotoIncludeList? _photos;

  @override
  Map<String, _is.Include?> get includes => {
    'shipment': _shipment,
    'photos': _photos,
  };

  @override
  _is.Table<int?> get table => ShipmentItem.t;
}

class ShipmentItemIncludeList extends _is.IncludeList {
  ShipmentItemIncludeList._({
    _is.WhereExpressionBuilder<ShipmentItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ShipmentItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ShipmentItem.t;
}

class ShipmentItemRepository {
  const ShipmentItemRepository._();

  final attach = const ShipmentItemAttachRepository._();

  final attachRow = const ShipmentItemAttachRowRepository._();

  /// Returns a list of [ShipmentItem]s matching the given query parameters.
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
  Future<List<ShipmentItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShipmentItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShipmentItemTable>? orderBy,
    _is.OrderByListBuilder<ShipmentItemTable>? orderByList,
    _is.Transaction? transaction,
    ShipmentItemInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ShipmentItem>(
      where: where?.call(ShipmentItem.t),
      orderBy: orderBy?.call(ShipmentItem.t),
      orderByList: orderByList?.call(ShipmentItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ShipmentItem] matching the given query parameters.
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
  Future<ShipmentItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShipmentItemTable>? where,
    int? offset,
    _is.OrderByBuilder<ShipmentItemTable>? orderBy,
    _is.OrderByListBuilder<ShipmentItemTable>? orderByList,
    _is.Transaction? transaction,
    ShipmentItemInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ShipmentItem>(
      where: where?.call(ShipmentItem.t),
      orderBy: orderBy?.call(ShipmentItem.t),
      orderByList: orderByList?.call(ShipmentItem.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ShipmentItem] by its [id] or null if no such row exists.
  Future<ShipmentItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    ShipmentItemInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ShipmentItem>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ShipmentItem]s in the list and returns the inserted rows.
  ///
  /// The returned [ShipmentItem]s will have their `id` fields set.
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
  Future<List<ShipmentItem>> insert(
    _is.DatabaseSession session,
    List<ShipmentItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ShipmentItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ShipmentItem] and returns the inserted row.
  ///
  /// The returned [ShipmentItem] will have its `id` field set.
  Future<ShipmentItem> insertRow(
    _is.DatabaseSession session,
    ShipmentItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ShipmentItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ShipmentItem]s in the list and returns the resulting rows.
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
  /// The returned [ShipmentItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ShipmentItem>> upsert(
    _is.DatabaseSession session,
    List<ShipmentItem> rows, {
    required _is.ColumnSelections<ShipmentItemTable> conflictColumns,
    _is.ColumnSelections<ShipmentItemTable>? updateColumns,
    _is.WhereExpressionBuilder<ShipmentItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ShipmentItem>(
      rows,
      conflictColumns: conflictColumns(ShipmentItem.t),
      updateColumns: updateColumns?.call(ShipmentItem.t),
      updateWhere: updateWhere?.call(ShipmentItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ShipmentItem] and returns the resulting row.
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
  /// The returned [ShipmentItem] will have its `id` field set.
  Future<ShipmentItem?> upsertRow(
    _is.DatabaseSession session,
    ShipmentItem row, {
    required _is.ColumnSelections<ShipmentItemTable> conflictColumns,
    _is.ColumnSelections<ShipmentItemTable>? updateColumns,
    _is.WhereExpressionBuilder<ShipmentItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ShipmentItem>(
      row,
      conflictColumns: conflictColumns(ShipmentItem.t),
      updateColumns: updateColumns?.call(ShipmentItem.t),
      updateWhere: updateWhere?.call(ShipmentItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [ShipmentItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ShipmentItem>> update(
    _is.DatabaseSession session,
    List<ShipmentItem> rows, {
    _is.ColumnSelections<ShipmentItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ShipmentItem>(
      rows,
      columns: columns?.call(ShipmentItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ShipmentItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ShipmentItem> updateRow(
    _is.DatabaseSession session,
    ShipmentItem row, {
    _is.ColumnSelections<ShipmentItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ShipmentItem>(
      row,
      columns: columns?.call(ShipmentItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ShipmentItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ShipmentItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ShipmentItemUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ShipmentItem>(
      id,
      columnValues: columnValues(ShipmentItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ShipmentItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ShipmentItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ShipmentItemUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ShipmentItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShipmentItemTable>? orderBy,
    _is.OrderByListBuilder<ShipmentItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ShipmentItem>(
      columnValues: columnValues(ShipmentItem.t.updateTable),
      where: where(ShipmentItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ShipmentItem.t),
      orderByList: orderByList?.call(ShipmentItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ShipmentItem]s in the list and returns the deleted rows.
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
  Future<List<ShipmentItem>> delete(
    _is.DatabaseSession session,
    List<ShipmentItem> rows, {
    _is.OrderByBuilder<ShipmentItemTable>? orderBy,
    _is.OrderByListBuilder<ShipmentItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ShipmentItem>(
      rows,
      orderBy: orderBy?.call(ShipmentItem.t),
      orderByList: orderByList?.call(ShipmentItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ShipmentItem].
  Future<ShipmentItem> deleteRow(
    _is.DatabaseSession session,
    ShipmentItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ShipmentItem>(
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
  Future<List<ShipmentItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ShipmentItemTable> where,
    _is.OrderByBuilder<ShipmentItemTable>? orderBy,
    _is.OrderByListBuilder<ShipmentItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ShipmentItem>(
      where: where(ShipmentItem.t),
      orderBy: orderBy?.call(ShipmentItem.t),
      orderByList: orderByList?.call(ShipmentItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShipmentItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ShipmentItem>(
      where: where?.call(ShipmentItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ShipmentItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ShipmentItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ShipmentItem>(
      where: where(ShipmentItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class ShipmentItemAttachRepository {
  const ShipmentItemAttachRepository._();

  /// Creates a relation between this [ShipmentItem] and the given [DamagePhoto]s
  /// by setting each [DamagePhoto]'s foreign key `itemId` to refer to this [ShipmentItem].
  Future<void> photos(
    _is.DatabaseSession session,
    ShipmentItem shipmentItem,
    List<_ii3dpnte.DamagePhoto> damagePhoto, {
    _is.Transaction? transaction,
  }) async {
    if (damagePhoto.any((e) => e.id == null)) {
      throw ArgumentError.notNull('damagePhoto.id');
    }
    if (shipmentItem.id == null) {
      throw ArgumentError.notNull('shipmentItem.id');
    }

    var $damagePhoto = damagePhoto
        .map((e) => e.copyWith(itemId: shipmentItem.id))
        .toList();
    await session.db.update<_ii3dpnte.DamagePhoto>(
      $damagePhoto,
      columns: [_ii3dpnte.DamagePhoto.t.itemId],
      transaction: transaction,
    );
  }
}

class ShipmentItemAttachRowRepository {
  const ShipmentItemAttachRowRepository._();

  /// Creates a relation between the given [ShipmentItem] and [Shipment]
  /// by setting the [ShipmentItem]'s foreign key `shipmentId` to refer to the [Shipment].
  Future<void> shipment(
    _is.DatabaseSession session,
    ShipmentItem shipmentItem,
    _imqpmfqf.Shipment shipment, {
    _is.Transaction? transaction,
  }) async {
    if (shipmentItem.id == null) {
      throw ArgumentError.notNull('shipmentItem.id');
    }
    if (shipment.id == null) {
      throw ArgumentError.notNull('shipment.id');
    }

    var $shipmentItem = shipmentItem.copyWith(shipmentId: shipment.id);
    await session.db.updateRow<ShipmentItem>(
      $shipmentItem,
      columns: [ShipmentItem.t.shipmentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ShipmentItem] and the given [DamagePhoto]
  /// by setting the [DamagePhoto]'s foreign key `itemId` to refer to this [ShipmentItem].
  Future<void> photos(
    _is.DatabaseSession session,
    ShipmentItem shipmentItem,
    _ii3dpnte.DamagePhoto damagePhoto, {
    _is.Transaction? transaction,
  }) async {
    if (damagePhoto.id == null) {
      throw ArgumentError.notNull('damagePhoto.id');
    }
    if (shipmentItem.id == null) {
      throw ArgumentError.notNull('shipmentItem.id');
    }

    var $damagePhoto = damagePhoto.copyWith(itemId: shipmentItem.id);
    await session.db.updateRow<_ii3dpnte.DamagePhoto>(
      $damagePhoto,
      columns: [_ii3dpnte.DamagePhoto.t.itemId],
      transaction: transaction,
    );
  }
}
