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

abstract class GearDataKayak
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearDataKayak._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    required this.minWeight,
    required this.maxWeight,
    required this.length,
  });

  factory GearDataKayak({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.KayakType type,
    required int minWeight,
    required int maxWeight,
    required int length,
  }) = _GearDataKayakImpl;

  factory GearDataKayak.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataKayak(
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

  static final t = GearDataKayakTable();

  static const db = GearDataKayakRepository._();

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

  /// Returns a shallow copy of this [GearDataKayak]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataKayak copyWith({
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

  static GearDataKayakInclude include({_i2.GearInclude? gear}) {
    return GearDataKayakInclude._(gear: gear);
  }

  static GearDataKayakIncludeList includeList({
    _i1.WhereExpressionBuilder<GearDataKayakTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataKayakTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataKayakTable>? orderByList,
    GearDataKayakInclude? include,
  }) {
    return GearDataKayakIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearDataKayak.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearDataKayak.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataKayakImpl extends GearDataKayak {
  _GearDataKayakImpl({
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

  /// Returns a shallow copy of this [GearDataKayak]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataKayak copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.KayakType? type,
    int? minWeight,
    int? maxWeight,
    int? length,
  }) {
    return GearDataKayak(
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

class GearDataKayakTable extends _i1.Table<int?> {
  GearDataKayakTable({super.tableRelation})
      : super(tableName: 'gear_data_kayaks') {
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
      field: GearDataKayak.t.gearId,
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

class GearDataKayakInclude extends _i1.IncludeObject {
  GearDataKayakInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearDataKayak.t;
}

class GearDataKayakIncludeList extends _i1.IncludeList {
  GearDataKayakIncludeList._({
    _i1.WhereExpressionBuilder<GearDataKayakTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearDataKayak.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearDataKayak.t;
}

class GearDataKayakRepository {
  const GearDataKayakRepository._();

  final attachRow = const GearDataKayakAttachRowRepository._();

  /// Returns a list of [GearDataKayak]s matching the given query parameters.
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
  Future<List<GearDataKayak>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataKayakTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataKayakTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataKayakTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataKayakInclude? include,
  }) async {
    return session.db.find<GearDataKayak>(
      where: where?.call(GearDataKayak.t),
      orderBy: orderBy?.call(GearDataKayak.t),
      orderByList: orderByList?.call(GearDataKayak.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearDataKayak] matching the given query parameters.
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
  Future<GearDataKayak?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataKayakTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearDataKayakTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataKayakTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataKayakInclude? include,
  }) async {
    return session.db.findFirstRow<GearDataKayak>(
      where: where?.call(GearDataKayak.t),
      orderBy: orderBy?.call(GearDataKayak.t),
      orderByList: orderByList?.call(GearDataKayak.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearDataKayak] by its [id] or null if no such row exists.
  Future<GearDataKayak?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearDataKayakInclude? include,
  }) async {
    return session.db.findById<GearDataKayak>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearDataKayak]s in the list and returns the inserted rows.
  ///
  /// The returned [GearDataKayak]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearDataKayak>> insert(
    _i1.Session session,
    List<GearDataKayak> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearDataKayak>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearDataKayak] and returns the inserted row.
  ///
  /// The returned [GearDataKayak] will have its `id` field set.
  Future<GearDataKayak> insertRow(
    _i1.Session session,
    GearDataKayak row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearDataKayak>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearDataKayak]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearDataKayak>> update(
    _i1.Session session,
    List<GearDataKayak> rows, {
    _i1.ColumnSelections<GearDataKayakTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearDataKayak>(
      rows,
      columns: columns?.call(GearDataKayak.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearDataKayak]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearDataKayak> updateRow(
    _i1.Session session,
    GearDataKayak row, {
    _i1.ColumnSelections<GearDataKayakTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearDataKayak>(
      row,
      columns: columns?.call(GearDataKayak.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearDataKayak]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearDataKayak>> delete(
    _i1.Session session,
    List<GearDataKayak> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearDataKayak>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearDataKayak].
  Future<GearDataKayak> deleteRow(
    _i1.Session session,
    GearDataKayak row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearDataKayak>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearDataKayak>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearDataKayakTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearDataKayak>(
      where: where(GearDataKayak.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataKayakTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearDataKayak>(
      where: where?.call(GearDataKayak.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearDataKayakAttachRowRepository {
  const GearDataKayakAttachRowRepository._();

  /// Creates a relation between the given [GearDataKayak] and [Gear]
  /// by setting the [GearDataKayak]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearDataKayak gearDataKayak,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearDataKayak.id == null) {
      throw ArgumentError.notNull('gearDataKayak.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearDataKayak = gearDataKayak.copyWith(gearId: gear.id);
    await session.db.updateRow<GearDataKayak>(
      $gearDataKayak,
      columns: [GearDataKayak.t.gearId],
      transaction: transaction,
    );
  }
}
