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

abstract class GearDataBelt
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearDataBelt._({
    this.id,
    required this.gearId,
    this.gear,
    required this.length,
  });

  factory GearDataBelt({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required double length,
  }) = _GearDataBeltImpl;

  factory GearDataBelt.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataBelt(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      length: (jsonSerialization['length'] as num).toDouble(),
    );
  }

  static final t = GearDataBeltTable();

  static const db = GearDataBeltRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  double length;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearDataBelt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataBelt copyWith({
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

  static GearDataBeltInclude include({_i2.GearInclude? gear}) {
    return GearDataBeltInclude._(gear: gear);
  }

  static GearDataBeltIncludeList includeList({
    _i1.WhereExpressionBuilder<GearDataBeltTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataBeltTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataBeltTable>? orderByList,
    GearDataBeltInclude? include,
  }) {
    return GearDataBeltIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearDataBelt.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearDataBelt.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataBeltImpl extends GearDataBelt {
  _GearDataBeltImpl({
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

  /// Returns a shallow copy of this [GearDataBelt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataBelt copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    double? length,
  }) {
    return GearDataBelt(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      length: length ?? this.length,
    );
  }
}

class GearDataBeltTable extends _i1.Table<int?> {
  GearDataBeltTable({super.tableRelation})
      : super(tableName: 'gear_data_belts') {
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
      field: GearDataBelt.t.gearId,
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

class GearDataBeltInclude extends _i1.IncludeObject {
  GearDataBeltInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearDataBelt.t;
}

class GearDataBeltIncludeList extends _i1.IncludeList {
  GearDataBeltIncludeList._({
    _i1.WhereExpressionBuilder<GearDataBeltTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearDataBelt.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearDataBelt.t;
}

class GearDataBeltRepository {
  const GearDataBeltRepository._();

  final attachRow = const GearDataBeltAttachRowRepository._();

  /// Returns a list of [GearDataBelt]s matching the given query parameters.
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
  Future<List<GearDataBelt>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataBeltTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataBeltTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataBeltTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataBeltInclude? include,
  }) async {
    return session.db.find<GearDataBelt>(
      where: where?.call(GearDataBelt.t),
      orderBy: orderBy?.call(GearDataBelt.t),
      orderByList: orderByList?.call(GearDataBelt.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearDataBelt] matching the given query parameters.
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
  Future<GearDataBelt?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataBeltTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearDataBeltTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataBeltTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataBeltInclude? include,
  }) async {
    return session.db.findFirstRow<GearDataBelt>(
      where: where?.call(GearDataBelt.t),
      orderBy: orderBy?.call(GearDataBelt.t),
      orderByList: orderByList?.call(GearDataBelt.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearDataBelt] by its [id] or null if no such row exists.
  Future<GearDataBelt?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearDataBeltInclude? include,
  }) async {
    return session.db.findById<GearDataBelt>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearDataBelt]s in the list and returns the inserted rows.
  ///
  /// The returned [GearDataBelt]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearDataBelt>> insert(
    _i1.Session session,
    List<GearDataBelt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearDataBelt>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearDataBelt] and returns the inserted row.
  ///
  /// The returned [GearDataBelt] will have its `id` field set.
  Future<GearDataBelt> insertRow(
    _i1.Session session,
    GearDataBelt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearDataBelt>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearDataBelt]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearDataBelt>> update(
    _i1.Session session,
    List<GearDataBelt> rows, {
    _i1.ColumnSelections<GearDataBeltTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearDataBelt>(
      rows,
      columns: columns?.call(GearDataBelt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearDataBelt]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearDataBelt> updateRow(
    _i1.Session session,
    GearDataBelt row, {
    _i1.ColumnSelections<GearDataBeltTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearDataBelt>(
      row,
      columns: columns?.call(GearDataBelt.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearDataBelt]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearDataBelt>> delete(
    _i1.Session session,
    List<GearDataBelt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearDataBelt>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearDataBelt].
  Future<GearDataBelt> deleteRow(
    _i1.Session session,
    GearDataBelt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearDataBelt>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearDataBelt>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearDataBeltTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearDataBelt>(
      where: where(GearDataBelt.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataBeltTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearDataBelt>(
      where: where?.call(GearDataBelt.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearDataBeltAttachRowRepository {
  const GearDataBeltAttachRowRepository._();

  /// Creates a relation between the given [GearDataBelt] and [Gear]
  /// by setting the [GearDataBelt]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearDataBelt gearDataBelt,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearDataBelt.id == null) {
      throw ArgumentError.notNull('gearDataBelt.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearDataBelt = gearDataBelt.copyWith(gearId: gear.id);
    await session.db.updateRow<GearDataBelt>(
      $gearDataBelt,
      columns: [GearDataBelt.t.gearId],
      transaction: transaction,
    );
  }
}
