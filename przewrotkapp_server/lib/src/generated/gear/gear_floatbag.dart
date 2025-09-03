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

abstract class GearFloatbag
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearFloatbag._({
    this.id,
    required this.gearId,
    this.gear,
    this.volume,
  });

  factory GearFloatbag({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    int? volume,
  }) = _GearFloatbagImpl;

  factory GearFloatbag.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearFloatbag(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      volume: jsonSerialization['volume'] as int?,
    );
  }

  static final t = GearFloatbagTable();

  static const db = GearFloatbagRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  int? volume;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearFloatbag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearFloatbag copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? volume,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      if (volume != null) 'volume': volume,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      if (volume != null) 'volume': volume,
    };
  }

  static GearFloatbagInclude include({_i2.GearInclude? gear}) {
    return GearFloatbagInclude._(gear: gear);
  }

  static GearFloatbagIncludeList includeList({
    _i1.WhereExpressionBuilder<GearFloatbagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearFloatbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearFloatbagTable>? orderByList,
    GearFloatbagInclude? include,
  }) {
    return GearFloatbagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearFloatbag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearFloatbag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearFloatbagImpl extends GearFloatbag {
  _GearFloatbagImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    int? volume,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          volume: volume,
        );

  /// Returns a shallow copy of this [GearFloatbag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearFloatbag copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    Object? volume = _Undefined,
  }) {
    return GearFloatbag(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      volume: volume is int? ? volume : this.volume,
    );
  }
}

class GearFloatbagTable extends _i1.Table<int?> {
  GearFloatbagTable({super.tableRelation})
      : super(tableName: 'gear_floatbags') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    volume = _i1.ColumnInt(
      'volume',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnInt volume;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearFloatbag.t.gearId,
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
        volume,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class GearFloatbagInclude extends _i1.IncludeObject {
  GearFloatbagInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearFloatbag.t;
}

class GearFloatbagIncludeList extends _i1.IncludeList {
  GearFloatbagIncludeList._({
    _i1.WhereExpressionBuilder<GearFloatbagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearFloatbag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearFloatbag.t;
}

class GearFloatbagRepository {
  const GearFloatbagRepository._();

  final attachRow = const GearFloatbagAttachRowRepository._();

  /// Returns a list of [GearFloatbag]s matching the given query parameters.
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
  Future<List<GearFloatbag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearFloatbagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearFloatbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearFloatbagTable>? orderByList,
    _i1.Transaction? transaction,
    GearFloatbagInclude? include,
  }) async {
    return session.db.find<GearFloatbag>(
      where: where?.call(GearFloatbag.t),
      orderBy: orderBy?.call(GearFloatbag.t),
      orderByList: orderByList?.call(GearFloatbag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearFloatbag] matching the given query parameters.
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
  Future<GearFloatbag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearFloatbagTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearFloatbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearFloatbagTable>? orderByList,
    _i1.Transaction? transaction,
    GearFloatbagInclude? include,
  }) async {
    return session.db.findFirstRow<GearFloatbag>(
      where: where?.call(GearFloatbag.t),
      orderBy: orderBy?.call(GearFloatbag.t),
      orderByList: orderByList?.call(GearFloatbag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearFloatbag] by its [id] or null if no such row exists.
  Future<GearFloatbag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearFloatbagInclude? include,
  }) async {
    return session.db.findById<GearFloatbag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearFloatbag]s in the list and returns the inserted rows.
  ///
  /// The returned [GearFloatbag]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearFloatbag>> insert(
    _i1.Session session,
    List<GearFloatbag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearFloatbag>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearFloatbag] and returns the inserted row.
  ///
  /// The returned [GearFloatbag] will have its `id` field set.
  Future<GearFloatbag> insertRow(
    _i1.Session session,
    GearFloatbag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearFloatbag>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearFloatbag]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearFloatbag>> update(
    _i1.Session session,
    List<GearFloatbag> rows, {
    _i1.ColumnSelections<GearFloatbagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearFloatbag>(
      rows,
      columns: columns?.call(GearFloatbag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearFloatbag]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearFloatbag> updateRow(
    _i1.Session session,
    GearFloatbag row, {
    _i1.ColumnSelections<GearFloatbagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearFloatbag>(
      row,
      columns: columns?.call(GearFloatbag.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearFloatbag]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearFloatbag>> delete(
    _i1.Session session,
    List<GearFloatbag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearFloatbag>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearFloatbag].
  Future<GearFloatbag> deleteRow(
    _i1.Session session,
    GearFloatbag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearFloatbag>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearFloatbag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearFloatbagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearFloatbag>(
      where: where(GearFloatbag.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearFloatbagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearFloatbag>(
      where: where?.call(GearFloatbag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearFloatbagAttachRowRepository {
  const GearFloatbagAttachRowRepository._();

  /// Creates a relation between the given [GearFloatbag] and [Gear]
  /// by setting the [GearFloatbag]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearFloatbag gearFloatbag,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearFloatbag.id == null) {
      throw ArgumentError.notNull('gearFloatbag.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearFloatbag = gearFloatbag.copyWith(gearId: gear.id);
    await session.db.updateRow<GearFloatbag>(
      $gearFloatbag,
      columns: [GearFloatbag.t.gearId],
      transaction: transaction,
    );
  }
}
