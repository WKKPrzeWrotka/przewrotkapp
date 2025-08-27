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
import '../gear/generic_gear_size.dart' as _i3;

abstract class GearHelmet
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearHelmet._({
    this.id,
    required this.gearId,
    this.gear,
    required this.size,
  });

  factory GearHelmet({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
  }) = _GearHelmetImpl;

  factory GearHelmet.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearHelmet(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      size: _i3.GenericGearSize.fromJson((jsonSerialization['size'] as String)),
    );
  }

  static final t = GearHelmetTable();

  static const db = GearHelmetRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.GenericGearSize size;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearHelmet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearHelmet copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.GenericGearSize? size,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'size': size.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'size': size.toJson(),
    };
  }

  static GearHelmetInclude include({_i2.GearInclude? gear}) {
    return GearHelmetInclude._(gear: gear);
  }

  static GearHelmetIncludeList includeList({
    _i1.WhereExpressionBuilder<GearHelmetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearHelmetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearHelmetTable>? orderByList,
    GearHelmetInclude? include,
  }) {
    return GearHelmetIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearHelmet.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearHelmet.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearHelmetImpl extends GearHelmet {
  _GearHelmetImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          size: size,
        );

  /// Returns a shallow copy of this [GearHelmet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearHelmet copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.GenericGearSize? size,
  }) {
    return GearHelmet(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      size: size ?? this.size,
    );
  }
}

class GearHelmetTable extends _i1.Table<int?> {
  GearHelmetTable({super.tableRelation}) : super(tableName: 'gear_helmets') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    size = _i1.ColumnEnum(
      'size',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnEnum<_i3.GenericGearSize> size;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearHelmet.t.gearId,
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
        size,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class GearHelmetInclude extends _i1.IncludeObject {
  GearHelmetInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearHelmet.t;
}

class GearHelmetIncludeList extends _i1.IncludeList {
  GearHelmetIncludeList._({
    _i1.WhereExpressionBuilder<GearHelmetTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearHelmet.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearHelmet.t;
}

class GearHelmetRepository {
  const GearHelmetRepository._();

  final attachRow = const GearHelmetAttachRowRepository._();

  /// Returns a list of [GearHelmet]s matching the given query parameters.
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
  Future<List<GearHelmet>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearHelmetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearHelmetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearHelmetTable>? orderByList,
    _i1.Transaction? transaction,
    GearHelmetInclude? include,
  }) async {
    return session.db.find<GearHelmet>(
      where: where?.call(GearHelmet.t),
      orderBy: orderBy?.call(GearHelmet.t),
      orderByList: orderByList?.call(GearHelmet.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearHelmet] matching the given query parameters.
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
  Future<GearHelmet?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearHelmetTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearHelmetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearHelmetTable>? orderByList,
    _i1.Transaction? transaction,
    GearHelmetInclude? include,
  }) async {
    return session.db.findFirstRow<GearHelmet>(
      where: where?.call(GearHelmet.t),
      orderBy: orderBy?.call(GearHelmet.t),
      orderByList: orderByList?.call(GearHelmet.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearHelmet] by its [id] or null if no such row exists.
  Future<GearHelmet?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearHelmetInclude? include,
  }) async {
    return session.db.findById<GearHelmet>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearHelmet]s in the list and returns the inserted rows.
  ///
  /// The returned [GearHelmet]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearHelmet>> insert(
    _i1.Session session,
    List<GearHelmet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearHelmet>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearHelmet] and returns the inserted row.
  ///
  /// The returned [GearHelmet] will have its `id` field set.
  Future<GearHelmet> insertRow(
    _i1.Session session,
    GearHelmet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearHelmet>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearHelmet]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearHelmet>> update(
    _i1.Session session,
    List<GearHelmet> rows, {
    _i1.ColumnSelections<GearHelmetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearHelmet>(
      rows,
      columns: columns?.call(GearHelmet.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearHelmet]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearHelmet> updateRow(
    _i1.Session session,
    GearHelmet row, {
    _i1.ColumnSelections<GearHelmetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearHelmet>(
      row,
      columns: columns?.call(GearHelmet.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearHelmet]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearHelmet>> delete(
    _i1.Session session,
    List<GearHelmet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearHelmet>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearHelmet].
  Future<GearHelmet> deleteRow(
    _i1.Session session,
    GearHelmet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearHelmet>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearHelmet>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearHelmetTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearHelmet>(
      where: where(GearHelmet.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearHelmetTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearHelmet>(
      where: where?.call(GearHelmet.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearHelmetAttachRowRepository {
  const GearHelmetAttachRowRepository._();

  /// Creates a relation between the given [GearHelmet] and [Gear]
  /// by setting the [GearHelmet]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearHelmet gearHelmet,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearHelmet.id == null) {
      throw ArgumentError.notNull('gearHelmet.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearHelmet = gearHelmet.copyWith(gearId: gear.id);
    await session.db.updateRow<GearHelmet>(
      $gearHelmet,
      columns: [GearHelmet.t.gearId],
      transaction: transaction,
    );
  }
}
