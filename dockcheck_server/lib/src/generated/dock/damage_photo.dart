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

/// Photo evidence of damage, stored in Serverpod file storage.
abstract class DamagePhoto
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
          : _ivv4um1u.Protocol().deserialize<_iqjjt2qt.ShipmentItem>(
              jsonSerialization['item'],
            ),
      storagePath: jsonSerialization['storagePath'] as String,
      takenAt: jsonSerialization['takenAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['takenAt']),
      url: jsonSerialization['url'] as String?,
    );
  }

  static final t = DamagePhotoTable();

  static const db = DamagePhotoRepository._();

  @override
  int? id;

  int itemId;

  _iqjjt2qt.ShipmentItem? item;

  String storagePath;

  DateTime takenAt;

  /// Public download URL, filled in on read (not stored).
  String? url;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [DamagePhoto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static DamagePhotoInclude include({_iqjjt2qt.ShipmentItemInclude? item}) {
    return DamagePhotoInclude._(item: item);
  }

  static DamagePhotoIncludeList includeList({
    _is.WhereExpressionBuilder<DamagePhotoTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DamagePhotoTable>? orderBy,
    _is.OrderByListBuilder<DamagePhotoTable>? orderByList,
    DamagePhotoInclude? include,
  }) {
    return DamagePhotoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DamagePhoto.t),
      orderByList: orderByList?.call(DamagePhoto.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class DamagePhotoUpdateTable extends _is.UpdateTable<DamagePhotoTable> {
  DamagePhotoUpdateTable(super.table);

  _is.ColumnValue<int, int> itemId(int value) => _is.ColumnValue(
    table.itemId,
    value,
  );

  _is.ColumnValue<String, String> storagePath(String value) => _is.ColumnValue(
    table.storagePath,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> takenAt(DateTime value) =>
      _is.ColumnValue(
        table.takenAt,
        value,
      );
}

class DamagePhotoTable extends _is.Table<int?> {
  DamagePhotoTable({super.tableRelation}) : super(tableName: 'damage_photo') {
    updateTable = DamagePhotoUpdateTable(this);
    itemId = _is.ColumnInt(
      'itemId',
      this,
    );
    storagePath = _is.ColumnString(
      'storagePath',
      this,
    );
    takenAt = _is.ColumnDateTime(
      'takenAt',
      this,
      hasDefault: true,
    );
  }

  late final DamagePhotoUpdateTable updateTable;

  late final _is.ColumnInt itemId;

  _iqjjt2qt.ShipmentItemTable? _item;

  late final _is.ColumnString storagePath;

  late final _is.ColumnDateTime takenAt;

  _iqjjt2qt.ShipmentItemTable get item {
    if (_item != null) return _item!;
    _item = _is.createRelationTable(
      relationFieldName: 'item',
      field: DamagePhoto.t.itemId,
      foreignField: _iqjjt2qt.ShipmentItem.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _iqjjt2qt.ShipmentItemTable(tableRelation: foreignTableRelation),
    );
    return _item!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    itemId,
    storagePath,
    takenAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'item') {
      return item;
    }
    return null;
  }
}

class DamagePhotoInclude extends _is.IncludeObject {
  DamagePhotoInclude._({_iqjjt2qt.ShipmentItemInclude? item}) {
    _item = item;
  }

  _iqjjt2qt.ShipmentItemInclude? _item;

  @override
  Map<String, _is.Include?> get includes => {'item': _item};

  @override
  _is.Table<int?> get table => DamagePhoto.t;
}

class DamagePhotoIncludeList extends _is.IncludeList {
  DamagePhotoIncludeList._({
    _is.WhereExpressionBuilder<DamagePhotoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DamagePhoto.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => DamagePhoto.t;
}

class DamagePhotoRepository {
  const DamagePhotoRepository._();

  final attachRow = const DamagePhotoAttachRowRepository._();

  /// Returns a list of [DamagePhoto]s matching the given query parameters.
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
  Future<List<DamagePhoto>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DamagePhotoTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DamagePhotoTable>? orderBy,
    _is.OrderByListBuilder<DamagePhotoTable>? orderByList,
    _is.Transaction? transaction,
    DamagePhotoInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<DamagePhoto>(
      where: where?.call(DamagePhoto.t),
      orderBy: orderBy?.call(DamagePhoto.t),
      orderByList: orderByList?.call(DamagePhoto.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [DamagePhoto] matching the given query parameters.
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
  Future<DamagePhoto?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DamagePhotoTable>? where,
    int? offset,
    _is.OrderByBuilder<DamagePhotoTable>? orderBy,
    _is.OrderByListBuilder<DamagePhotoTable>? orderByList,
    _is.Transaction? transaction,
    DamagePhotoInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<DamagePhoto>(
      where: where?.call(DamagePhoto.t),
      orderBy: orderBy?.call(DamagePhoto.t),
      orderByList: orderByList?.call(DamagePhoto.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [DamagePhoto] by its [id] or null if no such row exists.
  Future<DamagePhoto?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    DamagePhotoInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<DamagePhoto>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [DamagePhoto]s in the list and returns the inserted rows.
  ///
  /// The returned [DamagePhoto]s will have their `id` fields set.
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
  Future<List<DamagePhoto>> insert(
    _is.DatabaseSession session,
    List<DamagePhoto> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<DamagePhoto>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [DamagePhoto] and returns the inserted row.
  ///
  /// The returned [DamagePhoto] will have its `id` field set.
  Future<DamagePhoto> insertRow(
    _is.DatabaseSession session,
    DamagePhoto row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<DamagePhoto>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [DamagePhoto]s in the list and returns the resulting rows.
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
  /// The returned [DamagePhoto]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DamagePhoto>> upsert(
    _is.DatabaseSession session,
    List<DamagePhoto> rows, {
    required _is.ColumnSelections<DamagePhotoTable> conflictColumns,
    _is.ColumnSelections<DamagePhotoTable>? updateColumns,
    _is.WhereExpressionBuilder<DamagePhotoTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<DamagePhoto>(
      rows,
      conflictColumns: conflictColumns(DamagePhoto.t),
      updateColumns: updateColumns?.call(DamagePhoto.t),
      updateWhere: updateWhere?.call(DamagePhoto.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [DamagePhoto] and returns the resulting row.
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
  /// The returned [DamagePhoto] will have its `id` field set.
  Future<DamagePhoto?> upsertRow(
    _is.DatabaseSession session,
    DamagePhoto row, {
    required _is.ColumnSelections<DamagePhotoTable> conflictColumns,
    _is.ColumnSelections<DamagePhotoTable>? updateColumns,
    _is.WhereExpressionBuilder<DamagePhotoTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<DamagePhoto>(
      row,
      conflictColumns: conflictColumns(DamagePhoto.t),
      updateColumns: updateColumns?.call(DamagePhoto.t),
      updateWhere: updateWhere?.call(DamagePhoto.t),
      transaction: transaction,
    );
  }

  /// Updates all [DamagePhoto]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DamagePhoto>> update(
    _is.DatabaseSession session,
    List<DamagePhoto> rows, {
    _is.ColumnSelections<DamagePhotoTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<DamagePhoto>(
      rows,
      columns: columns?.call(DamagePhoto.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [DamagePhoto]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DamagePhoto> updateRow(
    _is.DatabaseSession session,
    DamagePhoto row, {
    _is.ColumnSelections<DamagePhotoTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<DamagePhoto>(
      row,
      columns: columns?.call(DamagePhoto.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DamagePhoto] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DamagePhoto?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<DamagePhotoUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<DamagePhoto>(
      id,
      columnValues: columnValues(DamagePhoto.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DamagePhoto]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DamagePhoto>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<DamagePhotoUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<DamagePhotoTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DamagePhotoTable>? orderBy,
    _is.OrderByListBuilder<DamagePhotoTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<DamagePhoto>(
      columnValues: columnValues(DamagePhoto.t.updateTable),
      where: where(DamagePhoto.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DamagePhoto.t),
      orderByList: orderByList?.call(DamagePhoto.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [DamagePhoto]s in the list and returns the deleted rows.
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
  Future<List<DamagePhoto>> delete(
    _is.DatabaseSession session,
    List<DamagePhoto> rows, {
    _is.OrderByBuilder<DamagePhotoTable>? orderBy,
    _is.OrderByListBuilder<DamagePhotoTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<DamagePhoto>(
      rows,
      orderBy: orderBy?.call(DamagePhoto.t),
      orderByList: orderByList?.call(DamagePhoto.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [DamagePhoto].
  Future<DamagePhoto> deleteRow(
    _is.DatabaseSession session,
    DamagePhoto row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DamagePhoto>(
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
  Future<List<DamagePhoto>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<DamagePhotoTable> where,
    _is.OrderByBuilder<DamagePhotoTable>? orderBy,
    _is.OrderByListBuilder<DamagePhotoTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<DamagePhoto>(
      where: where(DamagePhoto.t),
      orderBy: orderBy?.call(DamagePhoto.t),
      orderByList: orderByList?.call(DamagePhoto.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DamagePhotoTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<DamagePhoto>(
      where: where?.call(DamagePhoto.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [DamagePhoto] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<DamagePhotoTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<DamagePhoto>(
      where: where(DamagePhoto.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class DamagePhotoAttachRowRepository {
  const DamagePhotoAttachRowRepository._();

  /// Creates a relation between the given [DamagePhoto] and [ShipmentItem]
  /// by setting the [DamagePhoto]'s foreign key `itemId` to refer to the [ShipmentItem].
  Future<void> item(
    _is.DatabaseSession session,
    DamagePhoto damagePhoto,
    _iqjjt2qt.ShipmentItem item, {
    _is.Transaction? transaction,
  }) async {
    if (damagePhoto.id == null) {
      throw ArgumentError.notNull('damagePhoto.id');
    }
    if (item.id == null) {
      throw ArgumentError.notNull('item.id');
    }

    var $damagePhoto = damagePhoto.copyWith(itemId: item.id);
    await session.db.updateRow<DamagePhoto>(
      $damagePhoto,
      columns: [DamagePhoto.t.itemId],
      transaction: transaction,
    );
  }
}
