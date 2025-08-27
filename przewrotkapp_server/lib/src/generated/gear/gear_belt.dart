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

abstract class GearBelt
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearBelt._({
    this.id,
    required this.gearId,
    this.gear,
    required this.length,
  });

  factory GearBelt({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required double length,
  }) = _GearBeltImpl;

  factory GearBelt.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearBelt(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      length: (jsonSerialization['length'] as num).toDouble(),
    );
  }

  static final t = GearBeltTable();

  static const db = GearBeltRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  double length;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearBelt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearBelt copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    double? length,
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

  static GearBeltInclude include({_i2.GearInclude? gear}) {
    return GearBeltInclude._(gear: gear);
  }

  static GearBeltIncludeList includeList({
    _i1.WhereExpressionBuilder<GearBeltTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearBeltTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearBeltTable>? orderByList,
    GearBeltInclude? include,
  }) {
    return GearBeltIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearBelt.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearBelt.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearBeltImpl extends GearBelt {
  _GearBeltImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required double length,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          length: length,
        );

  /// Returns a shallow copy of this [GearBelt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearBelt copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    double? length,
  }) {
    return GearBelt(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      length: length ?? this.length,
    );
  }
}

class GearBeltTable extends _i1.Table<int?> {
  GearBeltTable({super.tableRelation}) : super(tableName: 'gear_belts') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    length = _i1.ColumnDouble(
      'length',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnDouble length;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearBelt.t.gearId,
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

class GearBeltInclude extends _i1.IncludeObject {
  GearBeltInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearBelt.t;
}

class GearBeltIncludeList extends _i1.IncludeList {
  GearBeltIncludeList._({
    _i1.WhereExpressionBuilder<GearBeltTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearBelt.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearBelt.t;
}

class GearBeltRepository {
  const GearBeltRepository._();

  final attachRow = const GearBeltAttachRowRepository._();

  /// Returns a list of [GearBelt]s matching the given query parameters.
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
  Future<List<GearBelt>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearBeltTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearBeltTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearBeltTable>? orderByList,
    _i1.Transaction? transaction,
    GearBeltInclude? include,
  }) async {
    return session.db.find<GearBelt>(
      where: where?.call(GearBelt.t),
      orderBy: orderBy?.call(GearBelt.t),
      orderByList: orderByList?.call(GearBelt.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearBelt] matching the given query parameters.
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
  Future<GearBelt?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearBeltTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearBeltTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearBeltTable>? orderByList,
    _i1.Transaction? transaction,
    GearBeltInclude? include,
  }) async {
    return session.db.findFirstRow<GearBelt>(
      where: where?.call(GearBelt.t),
      orderBy: orderBy?.call(GearBelt.t),
      orderByList: orderByList?.call(GearBelt.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearBelt] by its [id] or null if no such row exists.
  Future<GearBelt?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearBeltInclude? include,
  }) async {
    return session.db.findById<GearBelt>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearBelt]s in the list and returns the inserted rows.
  ///
  /// The returned [GearBelt]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearBelt>> insert(
    _i1.Session session,
    List<GearBelt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearBelt>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearBelt] and returns the inserted row.
  ///
  /// The returned [GearBelt] will have its `id` field set.
  Future<GearBelt> insertRow(
    _i1.Session session,
    GearBelt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearBelt>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearBelt]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearBelt>> update(
    _i1.Session session,
    List<GearBelt> rows, {
    _i1.ColumnSelections<GearBeltTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearBelt>(
      rows,
      columns: columns?.call(GearBelt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearBelt]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearBelt> updateRow(
    _i1.Session session,
    GearBelt row, {
    _i1.ColumnSelections<GearBeltTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearBelt>(
      row,
      columns: columns?.call(GearBelt.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearBelt]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearBelt>> delete(
    _i1.Session session,
    List<GearBelt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearBelt>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearBelt].
  Future<GearBelt> deleteRow(
    _i1.Session session,
    GearBelt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearBelt>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearBelt>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearBeltTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearBelt>(
      where: where(GearBelt.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearBeltTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearBelt>(
      where: where?.call(GearBelt.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearBeltAttachRowRepository {
  const GearBeltAttachRowRepository._();

  /// Creates a relation between the given [GearBelt] and [Gear]
  /// by setting the [GearBelt]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearBelt gearBelt,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearBelt.id == null) {
      throw ArgumentError.notNull('gearBelt.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearBelt = gearBelt.copyWith(gearId: gear.id);
    await session.db.updateRow<GearBelt>(
      $gearBelt,
      columns: [GearBelt.t.gearId],
      transaction: transaction,
    );
  }
}
