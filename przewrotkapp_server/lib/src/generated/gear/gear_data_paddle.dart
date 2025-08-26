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
import '../gear/paddle_type.dart' as _i3;

abstract class GearDataPaddle
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearDataPaddle._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    required this.length,
    required this.rotation,
  });

  factory GearDataPaddle({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.PaddleType type,
    required double length,
    required int rotation,
  }) = _GearDataPaddleImpl;

  factory GearDataPaddle.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataPaddle(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      type: _i3.PaddleType.fromJson((jsonSerialization['type'] as String)),
      length: (jsonSerialization['length'] as num).toDouble(),
      rotation: jsonSerialization['rotation'] as int,
    );
  }

  static final t = GearDataPaddleTable();

  static const db = GearDataPaddleRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.PaddleType type;

  double length;

  /// Negative values represents variable - "up to abs(rotation)"
  int rotation;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearDataPaddle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataPaddle copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.PaddleType? type,
    double? length,
    int? rotation,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'type': type.toJson(),
      'length': length,
      'rotation': rotation,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'type': type.toJson(),
      'length': length,
      'rotation': rotation,
    };
  }

  static GearDataPaddleInclude include({_i2.GearInclude? gear}) {
    return GearDataPaddleInclude._(gear: gear);
  }

  static GearDataPaddleIncludeList includeList({
    _i1.WhereExpressionBuilder<GearDataPaddleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataPaddleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataPaddleTable>? orderByList,
    GearDataPaddleInclude? include,
  }) {
    return GearDataPaddleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearDataPaddle.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearDataPaddle.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataPaddleImpl extends GearDataPaddle {
  _GearDataPaddleImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.PaddleType type,
    required double length,
    required int rotation,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          type: type,
          length: length,
          rotation: rotation,
        );

  /// Returns a shallow copy of this [GearDataPaddle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataPaddle copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.PaddleType? type,
    double? length,
    int? rotation,
  }) {
    return GearDataPaddle(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      length: length ?? this.length,
      rotation: rotation ?? this.rotation,
    );
  }
}

class GearDataPaddleTable extends _i1.Table<int?> {
  GearDataPaddleTable({super.tableRelation})
      : super(tableName: 'gear_data_paddles') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    length = _i1.ColumnDouble(
      'length',
      this,
    );
    rotation = _i1.ColumnInt(
      'rotation',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnEnum<_i3.PaddleType> type;

  late final _i1.ColumnDouble length;

  /// Negative values represents variable - "up to abs(rotation)"
  late final _i1.ColumnInt rotation;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearDataPaddle.t.gearId,
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
        length,
        rotation,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class GearDataPaddleInclude extends _i1.IncludeObject {
  GearDataPaddleInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearDataPaddle.t;
}

class GearDataPaddleIncludeList extends _i1.IncludeList {
  GearDataPaddleIncludeList._({
    _i1.WhereExpressionBuilder<GearDataPaddleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearDataPaddle.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearDataPaddle.t;
}

class GearDataPaddleRepository {
  const GearDataPaddleRepository._();

  final attachRow = const GearDataPaddleAttachRowRepository._();

  /// Returns a list of [GearDataPaddle]s matching the given query parameters.
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
  Future<List<GearDataPaddle>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataPaddleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataPaddleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataPaddleTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataPaddleInclude? include,
  }) async {
    return session.db.find<GearDataPaddle>(
      where: where?.call(GearDataPaddle.t),
      orderBy: orderBy?.call(GearDataPaddle.t),
      orderByList: orderByList?.call(GearDataPaddle.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearDataPaddle] matching the given query parameters.
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
  Future<GearDataPaddle?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataPaddleTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearDataPaddleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataPaddleTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataPaddleInclude? include,
  }) async {
    return session.db.findFirstRow<GearDataPaddle>(
      where: where?.call(GearDataPaddle.t),
      orderBy: orderBy?.call(GearDataPaddle.t),
      orderByList: orderByList?.call(GearDataPaddle.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearDataPaddle] by its [id] or null if no such row exists.
  Future<GearDataPaddle?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearDataPaddleInclude? include,
  }) async {
    return session.db.findById<GearDataPaddle>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearDataPaddle]s in the list and returns the inserted rows.
  ///
  /// The returned [GearDataPaddle]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearDataPaddle>> insert(
    _i1.Session session,
    List<GearDataPaddle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearDataPaddle>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearDataPaddle] and returns the inserted row.
  ///
  /// The returned [GearDataPaddle] will have its `id` field set.
  Future<GearDataPaddle> insertRow(
    _i1.Session session,
    GearDataPaddle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearDataPaddle>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearDataPaddle]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearDataPaddle>> update(
    _i1.Session session,
    List<GearDataPaddle> rows, {
    _i1.ColumnSelections<GearDataPaddleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearDataPaddle>(
      rows,
      columns: columns?.call(GearDataPaddle.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearDataPaddle]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearDataPaddle> updateRow(
    _i1.Session session,
    GearDataPaddle row, {
    _i1.ColumnSelections<GearDataPaddleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearDataPaddle>(
      row,
      columns: columns?.call(GearDataPaddle.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearDataPaddle]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearDataPaddle>> delete(
    _i1.Session session,
    List<GearDataPaddle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearDataPaddle>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearDataPaddle].
  Future<GearDataPaddle> deleteRow(
    _i1.Session session,
    GearDataPaddle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearDataPaddle>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearDataPaddle>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearDataPaddleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearDataPaddle>(
      where: where(GearDataPaddle.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataPaddleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearDataPaddle>(
      where: where?.call(GearDataPaddle.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearDataPaddleAttachRowRepository {
  const GearDataPaddleAttachRowRepository._();

  /// Creates a relation between the given [GearDataPaddle] and [Gear]
  /// by setting the [GearDataPaddle]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearDataPaddle gearDataPaddle,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearDataPaddle.id == null) {
      throw ArgumentError.notNull('gearDataPaddle.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearDataPaddle = gearDataPaddle.copyWith(gearId: gear.id);
    await session.db.updateRow<GearDataPaddle>(
      $gearDataPaddle,
      columns: [GearDataPaddle.t.gearId],
      transaction: transaction,
    );
  }
}
