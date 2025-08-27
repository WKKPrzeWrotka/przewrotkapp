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

abstract class GearPfd
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearPfd._({
    this.id,
    required this.gearId,
    this.gear,
    required this.size,
    required this.type,
  });

  factory GearPfd({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
    required _i4.PfdType type,
  }) = _GearPfdImpl;

  factory GearPfd.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearPfd(
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

  static final t = GearPfdTable();

  static const db = GearPfdRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.GenericGearSize size;

  _i4.PfdType type;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearPfd]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearPfd copyWith({
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

  static GearPfdInclude include({_i2.GearInclude? gear}) {
    return GearPfdInclude._(gear: gear);
  }

  static GearPfdIncludeList includeList({
    _i1.WhereExpressionBuilder<GearPfdTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearPfdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPfdTable>? orderByList,
    GearPfdInclude? include,
  }) {
    return GearPfdIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearPfd.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearPfd.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearPfdImpl extends GearPfd {
  _GearPfdImpl({
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

  /// Returns a shallow copy of this [GearPfd]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearPfd copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.GenericGearSize? size,
    _i4.PfdType? type,
  }) {
    return GearPfd(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      size: size ?? this.size,
      type: type ?? this.type,
    );
  }
}

class GearPfdTable extends _i1.Table<int?> {
  GearPfdTable({super.tableRelation}) : super(tableName: 'gear_pfds') {
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
      field: GearPfd.t.gearId,
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

class GearPfdInclude extends _i1.IncludeObject {
  GearPfdInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearPfd.t;
}

class GearPfdIncludeList extends _i1.IncludeList {
  GearPfdIncludeList._({
    _i1.WhereExpressionBuilder<GearPfdTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearPfd.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearPfd.t;
}

class GearPfdRepository {
  const GearPfdRepository._();

  final attachRow = const GearPfdAttachRowRepository._();

  /// Returns a list of [GearPfd]s matching the given query parameters.
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
  Future<List<GearPfd>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPfdTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearPfdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPfdTable>? orderByList,
    _i1.Transaction? transaction,
    GearPfdInclude? include,
  }) async {
    return session.db.find<GearPfd>(
      where: where?.call(GearPfd.t),
      orderBy: orderBy?.call(GearPfd.t),
      orderByList: orderByList?.call(GearPfd.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearPfd] matching the given query parameters.
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
  Future<GearPfd?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPfdTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearPfdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPfdTable>? orderByList,
    _i1.Transaction? transaction,
    GearPfdInclude? include,
  }) async {
    return session.db.findFirstRow<GearPfd>(
      where: where?.call(GearPfd.t),
      orderBy: orderBy?.call(GearPfd.t),
      orderByList: orderByList?.call(GearPfd.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearPfd] by its [id] or null if no such row exists.
  Future<GearPfd?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearPfdInclude? include,
  }) async {
    return session.db.findById<GearPfd>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearPfd]s in the list and returns the inserted rows.
  ///
  /// The returned [GearPfd]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearPfd>> insert(
    _i1.Session session,
    List<GearPfd> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearPfd>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearPfd] and returns the inserted row.
  ///
  /// The returned [GearPfd] will have its `id` field set.
  Future<GearPfd> insertRow(
    _i1.Session session,
    GearPfd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearPfd>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearPfd]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearPfd>> update(
    _i1.Session session,
    List<GearPfd> rows, {
    _i1.ColumnSelections<GearPfdTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearPfd>(
      rows,
      columns: columns?.call(GearPfd.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearPfd]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearPfd> updateRow(
    _i1.Session session,
    GearPfd row, {
    _i1.ColumnSelections<GearPfdTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearPfd>(
      row,
      columns: columns?.call(GearPfd.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearPfd]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearPfd>> delete(
    _i1.Session session,
    List<GearPfd> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearPfd>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearPfd].
  Future<GearPfd> deleteRow(
    _i1.Session session,
    GearPfd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearPfd>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearPfd>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearPfdTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearPfd>(
      where: where(GearPfd.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPfdTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearPfd>(
      where: where?.call(GearPfd.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearPfdAttachRowRepository {
  const GearPfdAttachRowRepository._();

  /// Creates a relation between the given [GearPfd] and [Gear]
  /// by setting the [GearPfd]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearPfd gearPfd,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearPfd.id == null) {
      throw ArgumentError.notNull('gearPfd.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearPfd = gearPfd.copyWith(gearId: gear.id);
    await session.db.updateRow<GearPfd>(
      $gearPfd,
      columns: [GearPfd.t.gearId],
      transaction: transaction,
    );
  }
}
