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

abstract class GearPaddle
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearPaddle._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    required this.length,
    required this.rotation,
  });

  factory GearPaddle({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.PaddleType type,
    required double length,
    required int rotation,
  }) = _GearPaddleImpl;

  factory GearPaddle.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearPaddle(
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

  static final t = GearPaddleTable();

  static const db = GearPaddleRepository._();

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

  /// Returns a shallow copy of this [GearPaddle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearPaddle copyWith({
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

  static GearPaddleInclude include({_i2.GearInclude? gear}) {
    return GearPaddleInclude._(gear: gear);
  }

  static GearPaddleIncludeList includeList({
    _i1.WhereExpressionBuilder<GearPaddleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearPaddleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPaddleTable>? orderByList,
    GearPaddleInclude? include,
  }) {
    return GearPaddleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearPaddle.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearPaddle.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearPaddleImpl extends GearPaddle {
  _GearPaddleImpl({
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

  /// Returns a shallow copy of this [GearPaddle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearPaddle copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.PaddleType? type,
    double? length,
    int? rotation,
  }) {
    return GearPaddle(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      length: length ?? this.length,
      rotation: rotation ?? this.rotation,
    );
  }
}

class GearPaddleTable extends _i1.Table<int?> {
  GearPaddleTable({super.tableRelation}) : super(tableName: 'gear_paddles') {
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
      field: GearPaddle.t.gearId,
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

class GearPaddleInclude extends _i1.IncludeObject {
  GearPaddleInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearPaddle.t;
}

class GearPaddleIncludeList extends _i1.IncludeList {
  GearPaddleIncludeList._({
    _i1.WhereExpressionBuilder<GearPaddleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearPaddle.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearPaddle.t;
}

class GearPaddleRepository {
  const GearPaddleRepository._();

  final attachRow = const GearPaddleAttachRowRepository._();

  /// Returns a list of [GearPaddle]s matching the given query parameters.
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
  Future<List<GearPaddle>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPaddleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearPaddleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPaddleTable>? orderByList,
    _i1.Transaction? transaction,
    GearPaddleInclude? include,
  }) async {
    return session.db.find<GearPaddle>(
      where: where?.call(GearPaddle.t),
      orderBy: orderBy?.call(GearPaddle.t),
      orderByList: orderByList?.call(GearPaddle.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearPaddle] matching the given query parameters.
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
  Future<GearPaddle?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPaddleTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearPaddleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPaddleTable>? orderByList,
    _i1.Transaction? transaction,
    GearPaddleInclude? include,
  }) async {
    return session.db.findFirstRow<GearPaddle>(
      where: where?.call(GearPaddle.t),
      orderBy: orderBy?.call(GearPaddle.t),
      orderByList: orderByList?.call(GearPaddle.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearPaddle] by its [id] or null if no such row exists.
  Future<GearPaddle?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearPaddleInclude? include,
  }) async {
    return session.db.findById<GearPaddle>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearPaddle]s in the list and returns the inserted rows.
  ///
  /// The returned [GearPaddle]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearPaddle>> insert(
    _i1.Session session,
    List<GearPaddle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearPaddle>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearPaddle] and returns the inserted row.
  ///
  /// The returned [GearPaddle] will have its `id` field set.
  Future<GearPaddle> insertRow(
    _i1.Session session,
    GearPaddle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearPaddle>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearPaddle]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearPaddle>> update(
    _i1.Session session,
    List<GearPaddle> rows, {
    _i1.ColumnSelections<GearPaddleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearPaddle>(
      rows,
      columns: columns?.call(GearPaddle.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearPaddle]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearPaddle> updateRow(
    _i1.Session session,
    GearPaddle row, {
    _i1.ColumnSelections<GearPaddleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearPaddle>(
      row,
      columns: columns?.call(GearPaddle.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearPaddle]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearPaddle>> delete(
    _i1.Session session,
    List<GearPaddle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearPaddle>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearPaddle].
  Future<GearPaddle> deleteRow(
    _i1.Session session,
    GearPaddle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearPaddle>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearPaddle>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearPaddleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearPaddle>(
      where: where(GearPaddle.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPaddleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearPaddle>(
      where: where?.call(GearPaddle.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearPaddleAttachRowRepository {
  const GearPaddleAttachRowRepository._();

  /// Creates a relation between the given [GearPaddle] and [Gear]
  /// by setting the [GearPaddle]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearPaddle gearPaddle,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearPaddle.id == null) {
      throw ArgumentError.notNull('gearPaddle.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearPaddle = gearPaddle.copyWith(gearId: gear.id);
    await session.db.updateRow<GearPaddle>(
      $gearPaddle,
      columns: [GearPaddle.t.gearId],
      transaction: transaction,
    );
  }
}
