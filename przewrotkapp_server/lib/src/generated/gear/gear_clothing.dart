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
import '../gear/clothing_type.dart' as _i3;

abstract class GearClothing
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearClothing._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    this.typeDescription,
  });

  factory GearClothing({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.ClothingType type,
    String? typeDescription,
  }) = _GearClothingImpl;

  factory GearClothing.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearClothing(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      type: _i3.ClothingType.fromJson((jsonSerialization['type'] as String)),
      typeDescription: jsonSerialization['typeDescription'] as String?,
    );
  }

  static final t = GearClothingTable();

  static const db = GearClothingRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.ClothingType type;

  String? typeDescription;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearClothing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearClothing copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.ClothingType? type,
    String? typeDescription,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'type': type.toJson(),
      if (typeDescription != null) 'typeDescription': typeDescription,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'type': type.toJson(),
      if (typeDescription != null) 'typeDescription': typeDescription,
    };
  }

  static GearClothingInclude include({_i2.GearInclude? gear}) {
    return GearClothingInclude._(gear: gear);
  }

  static GearClothingIncludeList includeList({
    _i1.WhereExpressionBuilder<GearClothingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearClothingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearClothingTable>? orderByList,
    GearClothingInclude? include,
  }) {
    return GearClothingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearClothing.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearClothing.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearClothingImpl extends GearClothing {
  _GearClothingImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.ClothingType type,
    String? typeDescription,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          type: type,
          typeDescription: typeDescription,
        );

  /// Returns a shallow copy of this [GearClothing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearClothing copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.ClothingType? type,
    Object? typeDescription = _Undefined,
  }) {
    return GearClothing(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      typeDescription:
          typeDescription is String? ? typeDescription : this.typeDescription,
    );
  }
}

class GearClothingTable extends _i1.Table<int?> {
  GearClothingTable({super.tableRelation}) : super(tableName: 'gear_clothes') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    typeDescription = _i1.ColumnString(
      'typeDescription',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnEnum<_i3.ClothingType> type;

  late final _i1.ColumnString typeDescription;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearClothing.t.gearId,
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
        type,
        typeDescription,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class GearClothingInclude extends _i1.IncludeObject {
  GearClothingInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearClothing.t;
}

class GearClothingIncludeList extends _i1.IncludeList {
  GearClothingIncludeList._({
    _i1.WhereExpressionBuilder<GearClothingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearClothing.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearClothing.t;
}

class GearClothingRepository {
  const GearClothingRepository._();

  final attachRow = const GearClothingAttachRowRepository._();

  /// Returns a list of [GearClothing]s matching the given query parameters.
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
  Future<List<GearClothing>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearClothingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearClothingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearClothingTable>? orderByList,
    _i1.Transaction? transaction,
    GearClothingInclude? include,
  }) async {
    return session.db.find<GearClothing>(
      where: where?.call(GearClothing.t),
      orderBy: orderBy?.call(GearClothing.t),
      orderByList: orderByList?.call(GearClothing.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearClothing] matching the given query parameters.
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
  Future<GearClothing?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearClothingTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearClothingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearClothingTable>? orderByList,
    _i1.Transaction? transaction,
    GearClothingInclude? include,
  }) async {
    return session.db.findFirstRow<GearClothing>(
      where: where?.call(GearClothing.t),
      orderBy: orderBy?.call(GearClothing.t),
      orderByList: orderByList?.call(GearClothing.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearClothing] by its [id] or null if no such row exists.
  Future<GearClothing?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearClothingInclude? include,
  }) async {
    return session.db.findById<GearClothing>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearClothing]s in the list and returns the inserted rows.
  ///
  /// The returned [GearClothing]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearClothing>> insert(
    _i1.Session session,
    List<GearClothing> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearClothing>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearClothing] and returns the inserted row.
  ///
  /// The returned [GearClothing] will have its `id` field set.
  Future<GearClothing> insertRow(
    _i1.Session session,
    GearClothing row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearClothing>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearClothing]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearClothing>> update(
    _i1.Session session,
    List<GearClothing> rows, {
    _i1.ColumnSelections<GearClothingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearClothing>(
      rows,
      columns: columns?.call(GearClothing.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearClothing]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearClothing> updateRow(
    _i1.Session session,
    GearClothing row, {
    _i1.ColumnSelections<GearClothingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearClothing>(
      row,
      columns: columns?.call(GearClothing.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearClothing]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearClothing>> delete(
    _i1.Session session,
    List<GearClothing> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearClothing>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearClothing].
  Future<GearClothing> deleteRow(
    _i1.Session session,
    GearClothing row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearClothing>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearClothing>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearClothingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearClothing>(
      where: where(GearClothing.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearClothingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearClothing>(
      where: where?.call(GearClothing.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearClothingAttachRowRepository {
  const GearClothingAttachRowRepository._();

  /// Creates a relation between the given [GearClothing] and [Gear]
  /// by setting the [GearClothing]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearClothing gearClothing,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearClothing.id == null) {
      throw ArgumentError.notNull('gearClothing.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearClothing = gearClothing.copyWith(gearId: gear.id);
    await session.db.updateRow<GearClothing>(
      $gearClothing,
      columns: [GearClothing.t.gearId],
      transaction: transaction,
    );
  }
}
