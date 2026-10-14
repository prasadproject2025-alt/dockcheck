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
import '../dock/staff_role.dart' as _iyzfzxxu;

/// Maps an authenticated user to their dock role.
abstract class StaffProfile
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  StaffProfile._({
    this.id,
    required this.authUserId,
    required this.role,
    required this.displayName,
  });

  factory StaffProfile({
    int? id,
    required _is.UuidValue authUserId,
    required _iyzfzxxu.StaffRoleType role,
    required String displayName,
  }) = _StaffProfileImpl;

  factory StaffProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return StaffProfile(
      id: jsonSerialization['id'] as int?,
      authUserId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      role: _iyzfzxxu.StaffRoleType.fromJson(
        (jsonSerialization['role'] as String),
      ),
      displayName: jsonSerialization['displayName'] as String,
    );
  }

  static final t = StaffProfileTable();

  static const db = StaffProfileRepository._();

  @override
  int? id;

  _is.UuidValue authUserId;

  _iyzfzxxu.StaffRoleType role;

  String displayName;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [StaffProfile]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  StaffProfile copyWith({
    int? id,
    _is.UuidValue? authUserId,
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

  static StaffProfileInclude include() {
    return StaffProfileInclude._();
  }

  static StaffProfileIncludeList includeList({
    _is.WhereExpressionBuilder<StaffProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StaffProfileTable>? orderBy,
    _is.OrderByListBuilder<StaffProfileTable>? orderByList,
    StaffProfileInclude? include,
  }) {
    return StaffProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StaffProfile.t),
      orderByList: orderByList?.call(StaffProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StaffProfileImpl extends StaffProfile {
  _StaffProfileImpl({
    int? id,
    required _is.UuidValue authUserId,
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
  @_is.useResult
  @override
  StaffProfile copyWith({
    Object? id = _Undefined,
    _is.UuidValue? authUserId,
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

class StaffProfileUpdateTable extends _is.UpdateTable<StaffProfileTable> {
  StaffProfileUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> authUserId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.authUserId,
    value,
  );

  _is.ColumnValue<_iyzfzxxu.StaffRoleType, _iyzfzxxu.StaffRoleType> role(
    _iyzfzxxu.StaffRoleType value,
  ) => _is.ColumnValue(
    table.role,
    value,
  );

  _is.ColumnValue<String, String> displayName(String value) => _is.ColumnValue(
    table.displayName,
    value,
  );
}

class StaffProfileTable extends _is.Table<int?> {
  StaffProfileTable({super.tableRelation}) : super(tableName: 'staff_profile') {
    updateTable = StaffProfileUpdateTable(this);
    authUserId = _is.ColumnUuid(
      'authUserId',
      this,
    );
    role = _is.ColumnEnum(
      'role',
      this,
      _is.EnumSerialization.byName,
    );
    displayName = _is.ColumnString(
      'displayName',
      this,
    );
  }

  late final StaffProfileUpdateTable updateTable;

  late final _is.ColumnUuid authUserId;

  late final _is.ColumnEnum<_iyzfzxxu.StaffRoleType> role;

  late final _is.ColumnString displayName;

  @override
  List<_is.Column> get columns => [
    id,
    authUserId,
    role,
    displayName,
  ];
}

class StaffProfileInclude extends _is.IncludeObject {
  StaffProfileInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => StaffProfile.t;
}

class StaffProfileIncludeList extends _is.IncludeList {
  StaffProfileIncludeList._({
    _is.WhereExpressionBuilder<StaffProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StaffProfile.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => StaffProfile.t;
}

class StaffProfileRepository {
  const StaffProfileRepository._();

  /// Returns a list of [StaffProfile]s matching the given query parameters.
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
  Future<List<StaffProfile>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StaffProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StaffProfileTable>? orderBy,
    _is.OrderByListBuilder<StaffProfileTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StaffProfile>(
      where: where?.call(StaffProfile.t),
      orderBy: orderBy?.call(StaffProfile.t),
      orderByList: orderByList?.call(StaffProfile.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StaffProfile] matching the given query parameters.
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
  Future<StaffProfile?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StaffProfileTable>? where,
    int? offset,
    _is.OrderByBuilder<StaffProfileTable>? orderBy,
    _is.OrderByListBuilder<StaffProfileTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StaffProfile>(
      where: where?.call(StaffProfile.t),
      orderBy: orderBy?.call(StaffProfile.t),
      orderByList: orderByList?.call(StaffProfile.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StaffProfile] by its [id] or null if no such row exists.
  Future<StaffProfile?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StaffProfile>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StaffProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [StaffProfile]s will have their `id` fields set.
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
  Future<List<StaffProfile>> insert(
    _is.DatabaseSession session,
    List<StaffProfile> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<StaffProfile>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [StaffProfile] and returns the inserted row.
  ///
  /// The returned [StaffProfile] will have its `id` field set.
  Future<StaffProfile> insertRow(
    _is.DatabaseSession session,
    StaffProfile row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<StaffProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [StaffProfile]s in the list and returns the resulting rows.
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
  /// The returned [StaffProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StaffProfile>> upsert(
    _is.DatabaseSession session,
    List<StaffProfile> rows, {
    required _is.ColumnSelections<StaffProfileTable> conflictColumns,
    _is.ColumnSelections<StaffProfileTable>? updateColumns,
    _is.WhereExpressionBuilder<StaffProfileTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<StaffProfile>(
      rows,
      conflictColumns: conflictColumns(StaffProfile.t),
      updateColumns: updateColumns?.call(StaffProfile.t),
      updateWhere: updateWhere?.call(StaffProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [StaffProfile] and returns the resulting row.
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
  /// The returned [StaffProfile] will have its `id` field set.
  Future<StaffProfile?> upsertRow(
    _is.DatabaseSession session,
    StaffProfile row, {
    required _is.ColumnSelections<StaffProfileTable> conflictColumns,
    _is.ColumnSelections<StaffProfileTable>? updateColumns,
    _is.WhereExpressionBuilder<StaffProfileTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<StaffProfile>(
      row,
      conflictColumns: conflictColumns(StaffProfile.t),
      updateColumns: updateColumns?.call(StaffProfile.t),
      updateWhere: updateWhere?.call(StaffProfile.t),
      transaction: transaction,
    );
  }

  /// Updates all [StaffProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StaffProfile>> update(
    _is.DatabaseSession session,
    List<StaffProfile> rows, {
    _is.ColumnSelections<StaffProfileTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<StaffProfile>(
      rows,
      columns: columns?.call(StaffProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [StaffProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StaffProfile> updateRow(
    _is.DatabaseSession session,
    StaffProfile row, {
    _is.ColumnSelections<StaffProfileTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<StaffProfile>(
      row,
      columns: columns?.call(StaffProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StaffProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StaffProfile?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<StaffProfileUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<StaffProfile>(
      id,
      columnValues: columnValues(StaffProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StaffProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StaffProfile>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<StaffProfileUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<StaffProfileTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StaffProfileTable>? orderBy,
    _is.OrderByListBuilder<StaffProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<StaffProfile>(
      columnValues: columnValues(StaffProfile.t.updateTable),
      where: where(StaffProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StaffProfile.t),
      orderByList: orderByList?.call(StaffProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [StaffProfile]s in the list and returns the deleted rows.
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
  Future<List<StaffProfile>> delete(
    _is.DatabaseSession session,
    List<StaffProfile> rows, {
    _is.OrderByBuilder<StaffProfileTable>? orderBy,
    _is.OrderByListBuilder<StaffProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<StaffProfile>(
      rows,
      orderBy: orderBy?.call(StaffProfile.t),
      orderByList: orderByList?.call(StaffProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [StaffProfile].
  Future<StaffProfile> deleteRow(
    _is.DatabaseSession session,
    StaffProfile row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StaffProfile>(
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
  Future<List<StaffProfile>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StaffProfileTable> where,
    _is.OrderByBuilder<StaffProfileTable>? orderBy,
    _is.OrderByListBuilder<StaffProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<StaffProfile>(
      where: where(StaffProfile.t),
      orderBy: orderBy?.call(StaffProfile.t),
      orderByList: orderByList?.call(StaffProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StaffProfileTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<StaffProfile>(
      where: where?.call(StaffProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StaffProfile] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StaffProfileTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StaffProfile>(
      where: where(StaffProfile.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
