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
import '../gear/pfd_type.dart' as _i4;

abstract class GearDataPfd
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearDataPfd._({
    this.id,
    required this.gearId,
    this.gear,
    required this.size,
    required this.type,
  });

  factory GearDataPfd({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
    required _i4.PfdType type,
  }) = _GearDataPfdImpl;

  factory GearDataPfd.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataPfd(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      size: _i3.GenericGearSize.fromJson((jsonSerialization['size'] as String)),
      type: _i4.PfdType.fromJson((jsonSerialization['type'] as String)),
    );
  }

  static final t = GearDataPfdTable();

  static const db = GearDataPfdRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.GenericGearSize size;

  _i4.PfdType type;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearDataPfd]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataPfd copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.GenericGearSize? size,
    _i4.PfdType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'size': size.toJson(),
      'type': type.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'size': size.toJson(),
      'type': type.toJson(),
    };
  }

  static GearDataPfdInclude include({_i2.GearInclude? gear}) {
    return GearDataPfdInclude._(gear: gear);
  }

  static GearDataPfdIncludeList includeList({
    _i1.WhereExpressionBuilder<GearDataPfdTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataPfdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataPfdTable>? orderByList,
    GearDataPfdInclude? include,
  }) {
    return GearDataPfdIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearDataPfd.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearDataPfd.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataPfdImpl extends GearDataPfd {
  _GearDataPfdImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
    required _i4.PfdType type,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          size: size,
          type: type,
        );

  /// Returns a shallow copy of this [GearDataPfd]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataPfd copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.GenericGearSize? size,
    _i4.PfdType? type,
  }) {
    return GearDataPfd(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      size: size ?? this.size,
      type: type ?? this.type,
    );
  }
}

class GearDataPfdTable extends _i1.Table<int?> {
  GearDataPfdTable({super.tableRelation}) : super(tableName: 'gear_data_pfds') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    size = _i1.ColumnEnum(
      'size',
      this,
      _i1.EnumSerialization.byName,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnEnum<_i3.GenericGearSize> size;

  late final _i1.ColumnEnum<_i4.PfdType> type;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearDataPfd.t.gearId,
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
        type,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class GearDataPfdInclude extends _i1.IncludeObject {
  GearDataPfdInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearDataPfd.t;
}

class GearDataPfdIncludeList extends _i1.IncludeList {
  GearDataPfdIncludeList._({
    _i1.WhereExpressionBuilder<GearDataPfdTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearDataPfd.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearDataPfd.t;
}

class GearDataPfdRepository {
  const GearDataPfdRepository._();

  final attachRow = const GearDataPfdAttachRowRepository._();

  /// Returns a list of [GearDataPfd]s matching the given query parameters.
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
  Future<List<GearDataPfd>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataPfdTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearDataPfdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataPfdTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataPfdInclude? include,
  }) async {
    return session.db.find<GearDataPfd>(
      where: where?.call(GearDataPfd.t),
      orderBy: orderBy?.call(GearDataPfd.t),
      orderByList: orderByList?.call(GearDataPfd.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearDataPfd] matching the given query parameters.
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
  Future<GearDataPfd?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataPfdTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearDataPfdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearDataPfdTable>? orderByList,
    _i1.Transaction? transaction,
    GearDataPfdInclude? include,
  }) async {
    return session.db.findFirstRow<GearDataPfd>(
      where: where?.call(GearDataPfd.t),
      orderBy: orderBy?.call(GearDataPfd.t),
      orderByList: orderByList?.call(GearDataPfd.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearDataPfd] by its [id] or null if no such row exists.
  Future<GearDataPfd?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearDataPfdInclude? include,
  }) async {
    return session.db.findById<GearDataPfd>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearDataPfd]s in the list and returns the inserted rows.
  ///
  /// The returned [GearDataPfd]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearDataPfd>> insert(
    _i1.Session session,
    List<GearDataPfd> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearDataPfd>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearDataPfd] and returns the inserted row.
  ///
  /// The returned [GearDataPfd] will have its `id` field set.
  Future<GearDataPfd> insertRow(
    _i1.Session session,
    GearDataPfd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearDataPfd>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearDataPfd]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearDataPfd>> update(
    _i1.Session session,
    List<GearDataPfd> rows, {
    _i1.ColumnSelections<GearDataPfdTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearDataPfd>(
      rows,
      columns: columns?.call(GearDataPfd.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearDataPfd]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearDataPfd> updateRow(
    _i1.Session session,
    GearDataPfd row, {
    _i1.ColumnSelections<GearDataPfdTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearDataPfd>(
      row,
      columns: columns?.call(GearDataPfd.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearDataPfd]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearDataPfd>> delete(
    _i1.Session session,
    List<GearDataPfd> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearDataPfd>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearDataPfd].
  Future<GearDataPfd> deleteRow(
    _i1.Session session,
    GearDataPfd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearDataPfd>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearDataPfd>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearDataPfdTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearDataPfd>(
      where: where(GearDataPfd.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearDataPfdTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearDataPfd>(
      where: where?.call(GearDataPfd.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearDataPfdAttachRowRepository {
  const GearDataPfdAttachRowRepository._();

  /// Creates a relation between the given [GearDataPfd] and [Gear]
  /// by setting the [GearDataPfd]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearDataPfd gearDataPfd,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearDataPfd.id == null) {
      throw ArgumentError.notNull('gearDataPfd.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearDataPfd = gearDataPfd.copyWith(gearId: gear.id);
    await session.db.updateRow<GearDataPfd>(
      $gearDataPfd,
      columns: [GearDataPfd.t.gearId],
      transaction: transaction,
    );
  }
}
