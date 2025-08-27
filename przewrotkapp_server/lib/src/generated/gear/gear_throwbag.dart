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

abstract class GearThrowbag
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearThrowbag._({
    this.id,
    required this.gearId,
    this.gear,
    required this.length,
  });

  factory GearThrowbag({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int length,
  }) = _GearThrowbagImpl;

  factory GearThrowbag.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearThrowbag(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      length: jsonSerialization['length'] as int,
    );
  }

  static final t = GearThrowbagTable();

  static const db = GearThrowbagRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  int length;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearThrowbag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearThrowbag copyWith({
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

  static GearThrowbagInclude include({_i2.GearInclude? gear}) {
    return GearThrowbagInclude._(gear: gear);
  }

  static GearThrowbagIncludeList includeList({
    _i1.WhereExpressionBuilder<GearThrowbagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearThrowbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearThrowbagTable>? orderByList,
    GearThrowbagInclude? include,
  }) {
    return GearThrowbagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearThrowbag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearThrowbag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearThrowbagImpl extends GearThrowbag {
  _GearThrowbagImpl({
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

  /// Returns a shallow copy of this [GearThrowbag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearThrowbag copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    int? length,
  }) {
    return GearThrowbag(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      length: length ?? this.length,
    );
  }
}

class GearThrowbagTable extends _i1.Table<int?> {
  GearThrowbagTable({super.tableRelation})
      : super(tableName: 'gear_throwbags') {
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
      field: GearThrowbag.t.gearId,
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

class GearThrowbagInclude extends _i1.IncludeObject {
  GearThrowbagInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearThrowbag.t;
}

class GearThrowbagIncludeList extends _i1.IncludeList {
  GearThrowbagIncludeList._({
    _i1.WhereExpressionBuilder<GearThrowbagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearThrowbag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearThrowbag.t;
}

class GearThrowbagRepository {
  const GearThrowbagRepository._();

  final attachRow = const GearThrowbagAttachRowRepository._();

  /// Returns a list of [GearThrowbag]s matching the given query parameters.
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
  Future<List<GearThrowbag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearThrowbagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearThrowbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearThrowbagTable>? orderByList,
    _i1.Transaction? transaction,
    GearThrowbagInclude? include,
  }) async {
    return session.db.find<GearThrowbag>(
      where: where?.call(GearThrowbag.t),
      orderBy: orderBy?.call(GearThrowbag.t),
      orderByList: orderByList?.call(GearThrowbag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearThrowbag] matching the given query parameters.
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
  Future<GearThrowbag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearThrowbagTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearThrowbagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearThrowbagTable>? orderByList,
    _i1.Transaction? transaction,
    GearThrowbagInclude? include,
  }) async {
    return session.db.findFirstRow<GearThrowbag>(
      where: where?.call(GearThrowbag.t),
      orderBy: orderBy?.call(GearThrowbag.t),
      orderByList: orderByList?.call(GearThrowbag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearThrowbag] by its [id] or null if no such row exists.
  Future<GearThrowbag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearThrowbagInclude? include,
  }) async {
    return session.db.findById<GearThrowbag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearThrowbag]s in the list and returns the inserted rows.
  ///
  /// The returned [GearThrowbag]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearThrowbag>> insert(
    _i1.Session session,
    List<GearThrowbag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearThrowbag>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearThrowbag] and returns the inserted row.
  ///
  /// The returned [GearThrowbag] will have its `id` field set.
  Future<GearThrowbag> insertRow(
    _i1.Session session,
    GearThrowbag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearThrowbag>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearThrowbag]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearThrowbag>> update(
    _i1.Session session,
    List<GearThrowbag> rows, {
    _i1.ColumnSelections<GearThrowbagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearThrowbag>(
      rows,
      columns: columns?.call(GearThrowbag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearThrowbag]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearThrowbag> updateRow(
    _i1.Session session,
    GearThrowbag row, {
    _i1.ColumnSelections<GearThrowbagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearThrowbag>(
      row,
      columns: columns?.call(GearThrowbag.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearThrowbag]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearThrowbag>> delete(
    _i1.Session session,
    List<GearThrowbag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearThrowbag>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearThrowbag].
  Future<GearThrowbag> deleteRow(
    _i1.Session session,
    GearThrowbag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearThrowbag>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearThrowbag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearThrowbagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearThrowbag>(
      where: where(GearThrowbag.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearThrowbagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearThrowbag>(
      where: where?.call(GearThrowbag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearThrowbagAttachRowRepository {
  const GearThrowbagAttachRowRepository._();

  /// Creates a relation between the given [GearThrowbag] and [Gear]
  /// by setting the [GearThrowbag]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearThrowbag gearThrowbag,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearThrowbag.id == null) {
      throw ArgumentError.notNull('gearThrowbag.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearThrowbag = gearThrowbag.copyWith(gearId: gear.id);
    await session.db.updateRow<GearThrowbag>(
      $gearThrowbag,
      columns: [GearThrowbag.t.gearId],
      transaction: transaction,
    );
  }
}
