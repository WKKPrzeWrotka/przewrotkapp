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

abstract class GearDataHelmet
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearDataHelmet._({
    this.id,
    required this.gearId,
    this.gear,
    required this.size,
  });

  factory GearDataHelmet({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
  }) = _GearDataHelmetImpl;

  factory GearDataHelmet.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataHelmet(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      size: _i3.GenericGearSize.fromJson((jsonSerialization['size'] as String)),
    );
  }

  static final t = GearDataHelmetTable();

  static const db = GearDataHelmetRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.GenericGearSize size;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearDataHelmet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataHelmet copyWith({
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

  static GearDataHelmetInclude include({_i2.GearInclude? gear}) {
    return GearDataHelmetInclude._(gear: gear);
  }

  static GearDataHelmetIncludeList includeList({
    _i1.WhereExpressionBuilder<GearDataHelmetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataHelmetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataHelmetTable>? orderByList,
    GearDataHelmetInclude? include,
  }) {
    return GearDataHelmetIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearDataHelmet.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearDataHelmet.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataHelmetImpl extends GearDataHelmet {
  _GearDataHelmetImpl({
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

  /// Returns a shallow copy of this [GearDataHelmet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataHelmet copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.GenericGearSize? size,
  }) {
    return GearDataHelmet(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      size: size ?? this.size,
    );
  }
}

class GearDataHelmetTable extends _i1.Table<int?> {
  GearDataHelmetTable({super.tableRelation})
      : super(tableName: 'gear_data_helmets') {
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
      field: GearDataHelmet.t.gearId,
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

class GearDataHelmetInclude extends _i1.IncludeObject {
  GearDataHelmetInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearDataHelmet.t;
}

class GearDataHelmetIncludeList extends _i1.IncludeList {
  GearDataHelmetIncludeList._({
    _i1.WhereExpressionBuilder<GearDataHelmetTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearDataHelmet.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearDataHelmet.t;
}

class GearDataHelmetRepository {
  const GearDataHelmetRepository._();

  final attachRow = const GearDataHelmetAttachRowRepository._();

  /// Returns a list of [GearDataHelmet]s matching the given query parameters.
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
  Future<List<GearDataHelmet>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataHelmetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataHelmetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataHelmetTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataHelmetInclude? include,
  }) async {
    return session.db.find<GearDataHelmet>(
      where: where?.call(GearDataHelmet.t),
      orderBy: orderBy?.call(GearDataHelmet.t),
      orderByList: orderByList?.call(GearDataHelmet.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearDataHelmet] matching the given query parameters.
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
  Future<GearDataHelmet?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataHelmetTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearDataHelmetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataHelmetTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataHelmetInclude? include,
  }) async {
    return session.db.findFirstRow<GearDataHelmet>(
      where: where?.call(GearDataHelmet.t),
      orderBy: orderBy?.call(GearDataHelmet.t),
      orderByList: orderByList?.call(GearDataHelmet.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearDataHelmet] by its [id] or null if no such row exists.
  Future<GearDataHelmet?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearDataHelmetInclude? include,
  }) async {
    return session.db.findById<GearDataHelmet>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearDataHelmet]s in the list and returns the inserted rows.
  ///
  /// The returned [GearDataHelmet]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearDataHelmet>> insert(
    _i1.Session session,
    List<GearDataHelmet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearDataHelmet>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearDataHelmet] and returns the inserted row.
  ///
  /// The returned [GearDataHelmet] will have its `id` field set.
  Future<GearDataHelmet> insertRow(
    _i1.Session session,
    GearDataHelmet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearDataHelmet>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearDataHelmet]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearDataHelmet>> update(
    _i1.Session session,
    List<GearDataHelmet> rows, {
    _i1.ColumnSelections<GearDataHelmetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearDataHelmet>(
      rows,
      columns: columns?.call(GearDataHelmet.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearDataHelmet]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearDataHelmet> updateRow(
    _i1.Session session,
    GearDataHelmet row, {
    _i1.ColumnSelections<GearDataHelmetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearDataHelmet>(
      row,
      columns: columns?.call(GearDataHelmet.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearDataHelmet]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearDataHelmet>> delete(
    _i1.Session session,
    List<GearDataHelmet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearDataHelmet>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearDataHelmet].
  Future<GearDataHelmet> deleteRow(
    _i1.Session session,
    GearDataHelmet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearDataHelmet>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearDataHelmet>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearDataHelmetTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearDataHelmet>(
      where: where(GearDataHelmet.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataHelmetTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearDataHelmet>(
      where: where?.call(GearDataHelmet.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearDataHelmetAttachRowRepository {
  const GearDataHelmetAttachRowRepository._();

  /// Creates a relation between the given [GearDataHelmet] and [Gear]
  /// by setting the [GearDataHelmet]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearDataHelmet gearDataHelmet,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearDataHelmet.id == null) {
      throw ArgumentError.notNull('gearDataHelmet.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearDataHelmet = gearDataHelmet.copyWith(gearId: gear.id);
    await session.db.updateRow<GearDataHelmet>(
      $gearDataHelmet,
      columns: [GearDataHelmet.t.gearId],
      transaction: transaction,
    );
  }
}
