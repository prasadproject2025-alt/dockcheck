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
import 'package:serverpod/serverpod.dart' as _is;
import '../dock/discrepancy_kind.dart' as _i8x9h4pu;

/// A mismatch found by the server when comparing expected and received.
abstract class Discrepancy
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = DiscrepancyTable();

  static const db = DiscrepancyRepository._();

  @override
  int? id;

  int shipmentId;

  String itemDescription;

  _i8x9h4pu.DiscrepancyKind kind;

  int quantity;

  /// 0-100, computed on the server.
  int severity;

  String explanation;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Discrepancy]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static DiscrepancyInclude include() {
    return DiscrepancyInclude._();
  }

  static DiscrepancyIncludeList includeList({
    _is.WhereExpressionBuilder<DiscrepancyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DiscrepancyTable>? orderBy,
    _is.OrderByListBuilder<DiscrepancyTable>? orderByList,
    DiscrepancyInclude? include,
  }) {
    return DiscrepancyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Discrepancy.t),
      orderByList: orderByList?.call(Discrepancy.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class DiscrepancyUpdateTable extends _is.UpdateTable<DiscrepancyTable> {
  DiscrepancyUpdateTable(super.table);

  _is.ColumnValue<int, int> shipmentId(int value) => _is.ColumnValue(
    table.shipmentId,
    value,
  );

  _is.ColumnValue<String, String> itemDescription(String value) =>
      _is.ColumnValue(
        table.itemDescription,
        value,
      );

  _is.ColumnValue<_i8x9h4pu.DiscrepancyKind, _i8x9h4pu.DiscrepancyKind> kind(
    _i8x9h4pu.DiscrepancyKind value,
  ) => _is.ColumnValue(
    table.kind,
    value,
  );

  _is.ColumnValue<int, int> quantity(int value) => _is.ColumnValue(
    table.quantity,
    value,
  );

  _is.ColumnValue<int, int> severity(int value) => _is.ColumnValue(
    table.severity,
    value,
  );

  _is.ColumnValue<String, String> explanation(String value) => _is.ColumnValue(
    table.explanation,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class DiscrepancyTable extends _is.Table<int?> {
  DiscrepancyTable({super.tableRelation}) : super(tableName: 'discrepancy') {
    updateTable = DiscrepancyUpdateTable(this);
    shipmentId = _is.ColumnInt(
      'shipmentId',
      this,
    );
    itemDescription = _is.ColumnString(
      'itemDescription',
      this,
    );
    kind = _is.ColumnEnum(
      'kind',
      this,
      _is.EnumSerialization.byName,
    );
    quantity = _is.ColumnInt(
      'quantity',
      this,
    );
    severity = _is.ColumnInt(
      'severity',
      this,
    );
    explanation = _is.ColumnString(
      'explanation',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final DiscrepancyUpdateTable updateTable;

  late final _is.ColumnInt shipmentId;

  late final _is.ColumnString itemDescription;

  late final _is.ColumnEnum<_i8x9h4pu.DiscrepancyKind> kind;

  late final _is.ColumnInt quantity;

  /// 0-100, computed on the server.
  late final _is.ColumnInt severity;

  late final _is.ColumnString explanation;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    shipmentId,
    itemDescription,
    kind,
    quantity,
    severity,
    explanation,
    createdAt,
  ];
}

class DiscrepancyInclude extends _is.IncludeObject {
  DiscrepancyInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Discrepancy.t;
}

class DiscrepancyIncludeList extends _is.IncludeList {
  DiscrepancyIncludeList._({
    _is.WhereExpressionBuilder<DiscrepancyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Discrepancy.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Discrepancy.t;
}

class DiscrepancyRepository {
  const DiscrepancyRepository._();

  /// Returns a list of [Discrepancy]s matching the given query parameters.
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
  Future<List<Discrepancy>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DiscrepancyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DiscrepancyTable>? orderBy,
    _is.OrderByListBuilder<DiscrepancyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Discrepancy>(
      where: where?.call(Discrepancy.t),
      orderBy: orderBy?.call(Discrepancy.t),
      orderByList: orderByList?.call(Discrepancy.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Discrepancy] matching the given query parameters.
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
  Future<Discrepancy?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DiscrepancyTable>? where,
    int? offset,
    _is.OrderByBuilder<DiscrepancyTable>? orderBy,
    _is.OrderByListBuilder<DiscrepancyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Discrepancy>(
      where: where?.call(Discrepancy.t),
      orderBy: orderBy?.call(Discrepancy.t),
      orderByList: orderByList?.call(Discrepancy.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Discrepancy] by its [id] or null if no such row exists.
  Future<Discrepancy?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Discrepancy>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Discrepancy]s in the list and returns the inserted rows.
  ///
  /// The returned [Discrepancy]s will have their `id` fields set.
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
  Future<List<Discrepancy>> insert(
    _is.DatabaseSession session,
    List<Discrepancy> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Discrepancy>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Discrepancy] and returns the inserted row.
  ///
  /// The returned [Discrepancy] will have its `id` field set.
  Future<Discrepancy> insertRow(
    _is.DatabaseSession session,
    Discrepancy row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Discrepancy>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Discrepancy]s in the list and returns the resulting rows.
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
  /// The returned [Discrepancy]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Discrepancy>> upsert(
    _is.DatabaseSession session,
    List<Discrepancy> rows, {
    required _is.ColumnSelections<DiscrepancyTable> conflictColumns,
    _is.ColumnSelections<DiscrepancyTable>? updateColumns,
    _is.WhereExpressionBuilder<DiscrepancyTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Discrepancy>(
      rows,
      conflictColumns: conflictColumns(Discrepancy.t),
      updateColumns: updateColumns?.call(Discrepancy.t),
      updateWhere: updateWhere?.call(Discrepancy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Discrepancy] and returns the resulting row.
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
  /// The returned [Discrepancy] will have its `id` field set.
  Future<Discrepancy?> upsertRow(
    _is.DatabaseSession session,
    Discrepancy row, {
    required _is.ColumnSelections<DiscrepancyTable> conflictColumns,
    _is.ColumnSelections<DiscrepancyTable>? updateColumns,
    _is.WhereExpressionBuilder<DiscrepancyTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Discrepancy>(
      row,
      conflictColumns: conflictColumns(Discrepancy.t),
      updateColumns: updateColumns?.call(Discrepancy.t),
      updateWhere: updateWhere?.call(Discrepancy.t),
      transaction: transaction,
    );
  }

  /// Updates all [Discrepancy]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Discrepancy>> update(
    _is.DatabaseSession session,
    List<Discrepancy> rows, {
    _is.ColumnSelections<DiscrepancyTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Discrepancy>(
      rows,
      columns: columns?.call(Discrepancy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Discrepancy]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Discrepancy> updateRow(
    _is.DatabaseSession session,
    Discrepancy row, {
    _is.ColumnSelections<DiscrepancyTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Discrepancy>(
      row,
      columns: columns?.call(Discrepancy.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Discrepancy] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Discrepancy?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<DiscrepancyUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Discrepancy>(
      id,
      columnValues: columnValues(Discrepancy.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Discrepancy]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Discrepancy>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<DiscrepancyUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<DiscrepancyTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DiscrepancyTable>? orderBy,
    _is.OrderByListBuilder<DiscrepancyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Discrepancy>(
      columnValues: columnValues(Discrepancy.t.updateTable),
      where: where(Discrepancy.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Discrepancy.t),
      orderByList: orderByList?.call(Discrepancy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Discrepancy]s in the list and returns the deleted rows.
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
  Future<List<Discrepancy>> delete(
    _is.DatabaseSession session,
    List<Discrepancy> rows, {
    _is.OrderByBuilder<DiscrepancyTable>? orderBy,
    _is.OrderByListBuilder<DiscrepancyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Discrepancy>(
      rows,
      orderBy: orderBy?.call(Discrepancy.t),
      orderByList: orderByList?.call(Discrepancy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Discrepancy].
  Future<Discrepancy> deleteRow(
    _is.DatabaseSession session,
    Discrepancy row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Discrepancy>(
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
  Future<List<Discrepancy>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<DiscrepancyTable> where,
    _is.OrderByBuilder<DiscrepancyTable>? orderBy,
    _is.OrderByListBuilder<DiscrepancyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Discrepancy>(
      where: where(Discrepancy.t),
      orderBy: orderBy?.call(Discrepancy.t),
      orderByList: orderByList?.call(Discrepancy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DiscrepancyTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Discrepancy>(
      where: where?.call(Discrepancy.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Discrepancy] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<DiscrepancyTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Discrepancy>(
      where: where(Discrepancy.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
