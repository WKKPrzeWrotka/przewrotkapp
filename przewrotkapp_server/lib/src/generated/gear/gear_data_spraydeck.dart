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
import '../gear/spraydeck_deck_size.dart' as _i3;
import '../gear/generic_gear_size.dart' as _i4;

abstract class GearDataSpraydeck
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearDataSpraydeck._({
    this.id,
    required this.gearId,
    this.gear,
    required this.deckSize,
    required this.waistSize,
  });

  factory GearDataSpraydeck({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.SpraydeckDeckSize deckSize,
    required _i4.GenericGearSize waistSize,
  }) = _GearDataSpraydeckImpl;

  factory GearDataSpraydeck.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataSpraydeck(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      deckSize: _i3.SpraydeckDeckSize.fromJson(
          (jsonSerialization['deckSize'] as String)),
      waistSize: _i4.GenericGearSize.fromJson(
          (jsonSerialization['waistSize'] as String)),
    );
  }

  static final t = GearDataSpraydeckTable();

  static const db = GearDataSpraydeckRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.SpraydeckDeckSize deckSize;

  _i4.GenericGearSize waistSize;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearDataSpraydeck]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataSpraydeck copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.SpraydeckDeckSize? deckSize,
    _i4.GenericGearSize? waistSize,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'deckSize': deckSize.toJson(),
      'waistSize': waistSize.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'deckSize': deckSize.toJson(),
      'waistSize': waistSize.toJson(),
    };
  }

  static GearDataSpraydeckInclude include({_i2.GearInclude? gear}) {
    return GearDataSpraydeckInclude._(gear: gear);
  }

  static GearDataSpraydeckIncludeList includeList({
    _i1.WhereExpressionBuilder<GearDataSpraydeckTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataSpraydeckTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataSpraydeckTable>? orderByList,
    GearDataSpraydeckInclude? include,
  }) {
    return GearDataSpraydeckIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearDataSpraydeck.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearDataSpraydeck.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataSpraydeckImpl extends GearDataSpraydeck {
  _GearDataSpraydeckImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.SpraydeckDeckSize deckSize,
    required _i4.GenericGearSize waistSize,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          deckSize: deckSize,
          waistSize: waistSize,
        );

  /// Returns a shallow copy of this [GearDataSpraydeck]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataSpraydeck copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.SpraydeckDeckSize? deckSize,
    _i4.GenericGearSize? waistSize,
  }) {
    return GearDataSpraydeck(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      deckSize: deckSize ?? this.deckSize,
      waistSize: waistSize ?? this.waistSize,
    );
  }
}

class GearDataSpraydeckTable extends _i1.Table<int?> {
  GearDataSpraydeckTable({super.tableRelation})
      : super(tableName: 'gear_data_spraydecks') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    deckSize = _i1.ColumnEnum(
      'deckSize',
      this,
      _i1.EnumSerialization.byName,
    );
    waistSize = _i1.ColumnEnum(
      'waistSize',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnEnum<_i3.SpraydeckDeckSize> deckSize;

  late final _i1.ColumnEnum<_i4.GenericGearSize> waistSize;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearDataSpraydeck.t.gearId,
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
        deckSize,
        waistSize,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class GearDataSpraydeckInclude extends _i1.IncludeObject {
  GearDataSpraydeckInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearDataSpraydeck.t;
}

class GearDataSpraydeckIncludeList extends _i1.IncludeList {
  GearDataSpraydeckIncludeList._({
    _i1.WhereExpressionBuilder<GearDataSpraydeckTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearDataSpraydeck.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearDataSpraydeck.t;
}

class GearDataSpraydeckRepository {
  const GearDataSpraydeckRepository._();

  final attachRow = const GearDataSpraydeckAttachRowRepository._();

  /// Returns a list of [GearDataSpraydeck]s matching the given query parameters.
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
  Future<List<GearDataSpraydeck>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataSpraydeckTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataSpraydeckTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataSpraydeckTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataSpraydeckInclude? include,
  }) async {
    return session.db.find<GearDataSpraydeck>(
      where: where?.call(GearDataSpraydeck.t),
      orderBy: orderBy?.call(GearDataSpraydeck.t),
      orderByList: orderByList?.call(GearDataSpraydeck.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearDataSpraydeck] matching the given query parameters.
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
  Future<GearDataSpraydeck?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataSpraydeckTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearDataSpraydeckTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataSpraydeckTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataSpraydeckInclude? include,
  }) async {
    return session.db.findFirstRow<GearDataSpraydeck>(
      where: where?.call(GearDataSpraydeck.t),
      orderBy: orderBy?.call(GearDataSpraydeck.t),
      orderByList: orderByList?.call(GearDataSpraydeck.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearDataSpraydeck] by its [id] or null if no such row exists.
  Future<GearDataSpraydeck?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearDataSpraydeckInclude? include,
  }) async {
    return session.db.findById<GearDataSpraydeck>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearDataSpraydeck]s in the list and returns the inserted rows.
  ///
  /// The returned [GearDataSpraydeck]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearDataSpraydeck>> insert(
    _i1.Session session,
    List<GearDataSpraydeck> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearDataSpraydeck>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearDataSpraydeck] and returns the inserted row.
  ///
  /// The returned [GearDataSpraydeck] will have its `id` field set.
  Future<GearDataSpraydeck> insertRow(
    _i1.Session session,
    GearDataSpraydeck row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearDataSpraydeck>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearDataSpraydeck]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearDataSpraydeck>> update(
    _i1.Session session,
    List<GearDataSpraydeck> rows, {
    _i1.ColumnSelections<GearDataSpraydeckTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearDataSpraydeck>(
      rows,
      columns: columns?.call(GearDataSpraydeck.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearDataSpraydeck]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearDataSpraydeck> updateRow(
    _i1.Session session,
    GearDataSpraydeck row, {
    _i1.ColumnSelections<GearDataSpraydeckTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearDataSpraydeck>(
      row,
      columns: columns?.call(GearDataSpraydeck.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearDataSpraydeck]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearDataSpraydeck>> delete(
    _i1.Session session,
    List<GearDataSpraydeck> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearDataSpraydeck>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearDataSpraydeck].
  Future<GearDataSpraydeck> deleteRow(
    _i1.Session session,
    GearDataSpraydeck row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearDataSpraydeck>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearDataSpraydeck>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearDataSpraydeckTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearDataSpraydeck>(
      where: where(GearDataSpraydeck.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataSpraydeckTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearDataSpraydeck>(
      where: where?.call(GearDataSpraydeck.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearDataSpraydeckAttachRowRepository {
  const GearDataSpraydeckAttachRowRepository._();

  /// Creates a relation between the given [GearDataSpraydeck] and [Gear]
  /// by setting the [GearDataSpraydeck]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearDataSpraydeck gearDataSpraydeck,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearDataSpraydeck.id == null) {
      throw ArgumentError.notNull('gearDataSpraydeck.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearDataSpraydeck = gearDataSpraydeck.copyWith(gearId: gear.id);
    await session.db.updateRow<GearDataSpraydeck>(
      $gearDataSpraydeck,
      columns: [GearDataSpraydeck.t.gearId],
      transaction: transaction,
    );
  }
}
