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
import '../gear/kayak_type.dart' as _i3;

abstract class GearKayak
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearKayak._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    required this.minWeight,
    required this.maxWeight,
    required this.length,
  });

  factory GearKayak({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.KayakType type,
    required int minWeight,
    required int maxWeight,
    required int length,
  }) = _GearKayakImpl;

  factory GearKayak.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearKayak(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      type: _i3.KayakType.fromJson((jsonSerialization['type'] as String)),
      minWeight: jsonSerialization['minWeight'] as int,
      maxWeight: jsonSerialization['maxWeight'] as int,
      length: jsonSerialization['length'] as int,
    );
  }

  static final t = GearKayakTable();

  static const db = GearKayakRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.KayakType type;

  int minWeight;

  int maxWeight;

  int length;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearKayak]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearKayak copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.KayakType? type,
    int? minWeight,
    int? maxWeight,
    int? length,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'type': type.toJson(),
      'minWeight': minWeight,
      'maxWeight': maxWeight,
      'length': length,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'type': type.toJson(),
      'minWeight': minWeight,
      'maxWeight': maxWeight,
      'length': length,
    };
  }

  static GearKayakInclude include({_i2.GearInclude? gear}) {
    return GearKayakInclude._(gear: gear);
  }

  static GearKayakIncludeList includeList({
    _i1.WhereExpressionBuilder<GearKayakTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearKayakTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearKayakTable>? orderByList,
    GearKayakInclude? include,
  }) {
    return GearKayakIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearKayak.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearKayak.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearKayakImpl extends GearKayak {
  _GearKayakImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.KayakType type,
    required int minWeight,
    required int maxWeight,
    required int length,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          type: type,
          minWeight: minWeight,
          maxWeight: maxWeight,
          length: length,
        );

  /// Returns a shallow copy of this [GearKayak]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearKayak copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.KayakType? type,
    int? minWeight,
    int? maxWeight,
    int? length,
  }) {
    return GearKayak(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      minWeight: minWeight ?? this.minWeight,
      maxWeight: maxWeight ?? this.maxWeight,
      length: length ?? this.length,
    );
  }
}

class GearKayakTable extends _i1.Table<int?> {
  GearKayakTable({super.tableRelation}) : super(tableName: 'gear_kayaks') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    minWeight = _i1.ColumnInt(
      'minWeight',
      this,
    );
    maxWeight = _i1.ColumnInt(
      'maxWeight',
      this,
    );
    length = _i1.ColumnInt(
      'length',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnEnum<_i3.KayakType> type;

  late final _i1.ColumnInt minWeight;

  late final _i1.ColumnInt maxWeight;

  late final _i1.ColumnInt length;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearKayak.t.gearId,
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
        minWeight,
        maxWeight,
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

class GearKayakInclude extends _i1.IncludeObject {
  GearKayakInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearKayak.t;
}

class GearKayakIncludeList extends _i1.IncludeList {
  GearKayakIncludeList._({
    _i1.WhereExpressionBuilder<GearKayakTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearKayak.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearKayak.t;
}

class GearKayakRepository {
  const GearKayakRepository._();

  final attachRow = const GearKayakAttachRowRepository._();

  /// Returns a list of [GearKayak]s matching the given query parameters.
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
  Future<List<GearKayak>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearKayakTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearKayakTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearKayakTable>? orderByList,
    _i1.Transaction? transaction,
    GearKayakInclude? include,
  }) async {
    return session.db.find<GearKayak>(
      where: where?.call(GearKayak.t),
      orderBy: orderBy?.call(GearKayak.t),
      orderByList: orderByList?.call(GearKayak.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearKayak] matching the given query parameters.
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
  Future<GearKayak?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearKayakTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearKayakTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearKayakTable>? orderByList,
    _i1.Transaction? transaction,
    GearKayakInclude? include,
  }) async {
    return session.db.findFirstRow<GearKayak>(
      where: where?.call(GearKayak.t),
      orderBy: orderBy?.call(GearKayak.t),
      orderByList: orderByList?.call(GearKayak.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearKayak] by its [id] or null if no such row exists.
  Future<GearKayak?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearKayakInclude? include,
  }) async {
    return session.db.findById<GearKayak>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearKayak]s in the list and returns the inserted rows.
  ///
  /// The returned [GearKayak]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearKayak>> insert(
    _i1.Session session,
    List<GearKayak> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearKayak>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearKayak] and returns the inserted row.
  ///
  /// The returned [GearKayak] will have its `id` field set.
  Future<GearKayak> insertRow(
    _i1.Session session,
    GearKayak row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearKayak>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearKayak]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearKayak>> update(
    _i1.Session session,
    List<GearKayak> rows, {
    _i1.ColumnSelections<GearKayakTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearKayak>(
      rows,
      columns: columns?.call(GearKayak.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearKayak]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearKayak> updateRow(
    _i1.Session session,
    GearKayak row, {
    _i1.ColumnSelections<GearKayakTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearKayak>(
      row,
      columns: columns?.call(GearKayak.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearKayak]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearKayak>> delete(
    _i1.Session session,
    List<GearKayak> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearKayak>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearKayak].
  Future<GearKayak> deleteRow(
    _i1.Session session,
    GearKayak row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearKayak>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearKayak>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearKayakTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearKayak>(
      where: where(GearKayak.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearKayakTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearKayak>(
      where: where?.call(GearKayak.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearKayakAttachRowRepository {
  const GearKayakAttachRowRepository._();

  /// Creates a relation between the given [GearKayak] and [Gear]
  /// by setting the [GearKayak]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearKayak gearKayak,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearKayak.id == null) {
      throw ArgumentError.notNull('gearKayak.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearKayak = gearKayak.copyWith(gearId: gear.id);
    await session.db.updateRow<GearKayak>(
      $gearKayak,
      columns: [GearKayak.t.gearId],
      transaction: transaction,
    );
  }
}
