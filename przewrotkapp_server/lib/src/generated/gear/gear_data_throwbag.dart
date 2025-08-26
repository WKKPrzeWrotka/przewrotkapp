/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../gear/gear.dart' as _i2;

abstract class GearDataThrowbag
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearDataThrowbag._({
    this.id,
    required this.gearId,
    this.gear,
    required this.length,
  });

  factory GearDataThrowbag({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int length,
  }) = _GearDataThrowbagImpl;

  factory GearDataThrowbag.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataThrowbag(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      length: jsonSerialization['length'] as int,
    );
  }

  static final t = GearDataThrowbagTable();

  static const db = GearDataThrowbagRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  int length;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearDataThrowbag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataThrowbag copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? length,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'length': length,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'length': length,
    };
  }

  static GearDataThrowbagInclude include({_i2.GearInclude? gear}) {
    return GearDataThrowbagInclude._(gear: gear);
  }

  static GearDataThrowbagIncludeList includeList({
    _i1.WhereExpressionBuilder<GearDataThrowbagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataThrowbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataThrowbagTable>? orderByList,
    GearDataThrowbagInclude? include,
  }) {
    return GearDataThrowbagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearDataThrowbag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearDataThrowbag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataThrowbagImpl extends GearDataThrowbag {
  _GearDataThrowbagImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int length,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          length: length,
        );

  /// Returns a shallow copy of this [GearDataThrowbag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataThrowbag copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    int? length,
  }) {
    return GearDataThrowbag(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      length: length ?? this.length,
    );
  }
}

class GearDataThrowbagTable extends _i1.Table<int?> {
  GearDataThrowbagTable({super.tableRelation})
      : super(tableName: 'gear_data_throwbags') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    length = _i1.ColumnInt(
      'length',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnInt length;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearDataThrowbag.t.gearId,
      foreignField: _i2.Gear.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GearTable(tableRelation: foreignTableRelation),
    );
    return _gear!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        gearId,
        length,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class GearDataThrowbagInclude extends _i1.IncludeObject {
  GearDataThrowbagInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearDataThrowbag.t;
}

class GearDataThrowbagIncludeList extends _i1.IncludeList {
  GearDataThrowbagIncludeList._({
    _i1.WhereExpressionBuilder<GearDataThrowbagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearDataThrowbag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearDataThrowbag.t;
}

class GearDataThrowbagRepository {
  const GearDataThrowbagRepository._();

  final attachRow = const GearDataThrowbagAttachRowRepository._();

  /// Returns a list of [GearDataThrowbag]s matching the given query parameters.
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
  Future<List<GearDataThrowbag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataThrowbagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataThrowbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataThrowbagTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataThrowbagInclude? include,
  }) async {
    return session.db.find<GearDataThrowbag>(
      where: where?.call(GearDataThrowbag.t),
      orderBy: orderBy?.call(GearDataThrowbag.t),
      orderByList: orderByList?.call(GearDataThrowbag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearDataThrowbag] matching the given query parameters.
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
  Future<GearDataThrowbag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataThrowbagTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearDataThrowbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataThrowbagTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataThrowbagInclude? include,
  }) async {
    return session.db.findFirstRow<GearDataThrowbag>(
      where: where?.call(GearDataThrowbag.t),
      orderBy: orderBy?.call(GearDataThrowbag.t),
      orderByList: orderByList?.call(GearDataThrowbag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearDataThrowbag] by its [id] or null if no such row exists.
  Future<GearDataThrowbag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearDataThrowbagInclude? include,
  }) async {
    return session.db.findById<GearDataThrowbag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearDataThrowbag]s in the list and returns the inserted rows.
  ///
  /// The returned [GearDataThrowbag]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearDataThrowbag>> insert(
    _i1.Session session,
    List<GearDataThrowbag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearDataThrowbag>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearDataThrowbag] and returns the inserted row.
  ///
  /// The returned [GearDataThrowbag] will have its `id` field set.
  Future<GearDataThrowbag> insertRow(
    _i1.Session session,
    GearDataThrowbag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearDataThrowbag>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearDataThrowbag]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearDataThrowbag>> update(
    _i1.Session session,
    List<GearDataThrowbag> rows, {
    _i1.ColumnSelections<GearDataThrowbagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearDataThrowbag>(
      rows,
      columns: columns?.call(GearDataThrowbag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearDataThrowbag]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearDataThrowbag> updateRow(
    _i1.Session session,
    GearDataThrowbag row, {
    _i1.ColumnSelections<GearDataThrowbagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearDataThrowbag>(
      row,
      columns: columns?.call(GearDataThrowbag.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearDataThrowbag]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearDataThrowbag>> delete(
    _i1.Session session,
    List<GearDataThrowbag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearDataThrowbag>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearDataThrowbag].
  Future<GearDataThrowbag> deleteRow(
    _i1.Session session,
    GearDataThrowbag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearDataThrowbag>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearDataThrowbag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearDataThrowbagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearDataThrowbag>(
      where: where(GearDataThrowbag.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataThrowbagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearDataThrowbag>(
      where: where?.call(GearDataThrowbag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearDataThrowbagAttachRowRepository {
  const GearDataThrowbagAttachRowRepository._();

  /// Creates a relation between the given [GearDataThrowbag] and [Gear]
  /// by setting the [GearDataThrowbag]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearDataThrowbag gearDataThrowbag,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearDataThrowbag.id == null) {
      throw ArgumentError.notNull('gearDataThrowbag.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearDataThrowbag = gearDataThrowbag.copyWith(gearId: gear.id);
    await session.db.updateRow<GearDataThrowbag>(
      $gearDataThrowbag,
      columns: [GearDataThrowbag.t.gearId],
      transaction: transaction,
    );
  }
}
