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

abstract class GearDataClothing
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearDataClothing._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    this.typeDescription,
  });

  factory GearDataClothing({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.ClothingType type,
    String? typeDescription,
  }) = _GearDataClothingImpl;

  factory GearDataClothing.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataClothing(
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

  static final t = GearDataClothingTable();

  static const db = GearDataClothingRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.ClothingType type;

  String? typeDescription;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearDataClothing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataClothing copyWith({
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

  static GearDataClothingInclude include({_i2.GearInclude? gear}) {
    return GearDataClothingInclude._(gear: gear);
  }

  static GearDataClothingIncludeList includeList({
    _i1.WhereExpressionBuilder<GearDataClothingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataClothingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataClothingTable>? orderByList,
    GearDataClothingInclude? include,
  }) {
    return GearDataClothingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearDataClothing.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearDataClothing.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataClothingImpl extends GearDataClothing {
  _GearDataClothingImpl({
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

  /// Returns a shallow copy of this [GearDataClothing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataClothing copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.ClothingType? type,
    Object? typeDescription = _Undefined,
  }) {
    return GearDataClothing(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      typeDescription:
          typeDescription is String? ? typeDescription : this.typeDescription,
    );
  }
}

class GearDataClothingTable extends _i1.Table<int?> {
  GearDataClothingTable({super.tableRelation})
      : super(tableName: 'gear_data_clothes') {
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
      field: GearDataClothing.t.gearId,
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

class GearDataClothingInclude extends _i1.IncludeObject {
  GearDataClothingInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearDataClothing.t;
}

class GearDataClothingIncludeList extends _i1.IncludeList {
  GearDataClothingIncludeList._({
    _i1.WhereExpressionBuilder<GearDataClothingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearDataClothing.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearDataClothing.t;
}

class GearDataClothingRepository {
  const GearDataClothingRepository._();

  final attachRow = const GearDataClothingAttachRowRepository._();

  /// Returns a list of [GearDataClothing]s matching the given query parameters.
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
  Future<List<GearDataClothing>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataClothingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataClothingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataClothingTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataClothingInclude? include,
  }) async {
    return session.db.find<GearDataClothing>(
      where: where?.call(GearDataClothing.t),
      orderBy: orderBy?.call(GearDataClothing.t),
      orderByList: orderByList?.call(GearDataClothing.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearDataClothing] matching the given query parameters.
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
  Future<GearDataClothing?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataClothingTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearDataClothingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataClothingTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataClothingInclude? include,
  }) async {
    return session.db.findFirstRow<GearDataClothing>(
      where: where?.call(GearDataClothing.t),
      orderBy: orderBy?.call(GearDataClothing.t),
      orderByList: orderByList?.call(GearDataClothing.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearDataClothing] by its [id] or null if no such row exists.
  Future<GearDataClothing?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearDataClothingInclude? include,
  }) async {
    return session.db.findById<GearDataClothing>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearDataClothing]s in the list and returns the inserted rows.
  ///
  /// The returned [GearDataClothing]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearDataClothing>> insert(
    _i1.Session session,
    List<GearDataClothing> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearDataClothing>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearDataClothing] and returns the inserted row.
  ///
  /// The returned [GearDataClothing] will have its `id` field set.
  Future<GearDataClothing> insertRow(
    _i1.Session session,
    GearDataClothing row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearDataClothing>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearDataClothing]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearDataClothing>> update(
    _i1.Session session,
    List<GearDataClothing> rows, {
    _i1.ColumnSelections<GearDataClothingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearDataClothing>(
      rows,
      columns: columns?.call(GearDataClothing.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearDataClothing]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearDataClothing> updateRow(
    _i1.Session session,
    GearDataClothing row, {
    _i1.ColumnSelections<GearDataClothingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearDataClothing>(
      row,
      columns: columns?.call(GearDataClothing.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearDataClothing]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearDataClothing>> delete(
    _i1.Session session,
    List<GearDataClothing> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearDataClothing>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearDataClothing].
  Future<GearDataClothing> deleteRow(
    _i1.Session session,
    GearDataClothing row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearDataClothing>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearDataClothing>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearDataClothingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearDataClothing>(
      where: where(GearDataClothing.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataClothingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearDataClothing>(
      where: where?.call(GearDataClothing.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearDataClothingAttachRowRepository {
  const GearDataClothingAttachRowRepository._();

  /// Creates a relation between the given [GearDataClothing] and [Gear]
  /// by setting the [GearDataClothing]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearDataClothing gearDataClothing,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearDataClothing.id == null) {
      throw ArgumentError.notNull('gearDataClothing.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearDataClothing = gearDataClothing.copyWith(gearId: gear.id);
    await session.db.updateRow<GearDataClothing>(
      $gearDataClothing,
      columns: [GearDataClothing.t.gearId],
      transaction: transaction,
    );
  }
}
