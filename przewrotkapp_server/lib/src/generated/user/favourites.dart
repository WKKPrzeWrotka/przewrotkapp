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
import '../user/extra_user_info.dart' as _i3;

abstract class FavouritesJunction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  FavouritesJunction._({
    this.id,
    required this.gearId,
    this.gear,
    required this.extraUserInfoId,
    this.extraUserInfo,
  });

  factory FavouritesJunction({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int extraUserInfoId,
    _i3.ExtraUserInfo? extraUserInfo,
  }) = _FavouritesJunctionImpl;

  factory FavouritesJunction.fromJson(Map<String, dynamic> jsonSerialization) {
    return FavouritesJunction(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      extraUserInfoId: jsonSerialization['extraUserInfoId'] as int,
      extraUserInfo: jsonSerialization['extraUserInfo'] == null
          ? null
          : _i3.ExtraUserInfo.fromJson(
              (jsonSerialization['extraUserInfo'] as Map<String, dynamic>)),
    );
  }

  static final t = FavouritesJunctionTable();

  static const db = FavouritesJunctionRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  int extraUserInfoId;

  _i3.ExtraUserInfo? extraUserInfo;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [FavouritesJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FavouritesJunction copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? extraUserInfoId,
    _i3.ExtraUserInfo? extraUserInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'extraUserInfoId': extraUserInfoId,
      if (extraUserInfo != null) 'extraUserInfo': extraUserInfo?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'extraUserInfoId': extraUserInfoId,
      if (extraUserInfo != null)
        'extraUserInfo': extraUserInfo?.toJsonForProtocol(),
    };
  }

  static FavouritesJunctionInclude include({
    _i2.GearInclude? gear,
    _i3.ExtraUserInfoInclude? extraUserInfo,
  }) {
    return FavouritesJunctionInclude._(
      gear: gear,
      extraUserInfo: extraUserInfo,
    );
  }

  static FavouritesJunctionIncludeList includeList({
    _i1.WhereExpressionBuilder<FavouritesJunctionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FavouritesJunctionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FavouritesJunctionTable>? orderByList,
    FavouritesJunctionInclude? include,
  }) {
    return FavouritesJunctionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FavouritesJunction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FavouritesJunction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FavouritesJunctionImpl extends FavouritesJunction {
  _FavouritesJunctionImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int extraUserInfoId,
    _i3.ExtraUserInfo? extraUserInfo,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          extraUserInfoId: extraUserInfoId,
          extraUserInfo: extraUserInfo,
        );

  /// Returns a shallow copy of this [FavouritesJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FavouritesJunction copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    int? extraUserInfoId,
    Object? extraUserInfo = _Undefined,
  }) {
    return FavouritesJunction(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      extraUserInfoId: extraUserInfoId ?? this.extraUserInfoId,
      extraUserInfo: extraUserInfo is _i3.ExtraUserInfo?
          ? extraUserInfo
          : this.extraUserInfo?.copyWith(),
    );
  }
}

class FavouritesJunctionTable extends _i1.Table<int?> {
  FavouritesJunctionTable({super.tableRelation})
      : super(tableName: 'favourites_junctions') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    extraUserInfoId = _i1.ColumnInt(
      'extraUserInfoId',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnInt extraUserInfoId;

  _i3.ExtraUserInfoTable? _extraUserInfo;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: FavouritesJunction.t.gearId,
      foreignField: _i2.Gear.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GearTable(tableRelation: foreignTableRelation),
    );
    return _gear!;
  }

  _i3.ExtraUserInfoTable get extraUserInfo {
    if (_extraUserInfo != null) return _extraUserInfo!;
    _extraUserInfo = _i1.createRelationTable(
      relationFieldName: 'extraUserInfo',
      field: FavouritesJunction.t.extraUserInfoId,
      foreignField: _i3.ExtraUserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ExtraUserInfoTable(tableRelation: foreignTableRelation),
    );
    return _extraUserInfo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        gearId,
        extraUserInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    if (relationField == 'extraUserInfo') {
      return extraUserInfo;
    }
    return null;
  }
}

class FavouritesJunctionInclude extends _i1.IncludeObject {
  FavouritesJunctionInclude._({
    _i2.GearInclude? gear,
    _i3.ExtraUserInfoInclude? extraUserInfo,
  }) {
    _gear = gear;
    _extraUserInfo = extraUserInfo;
  }

  _i2.GearInclude? _gear;

  _i3.ExtraUserInfoInclude? _extraUserInfo;

  @override
  Map<String, _i1.Include?> get includes => {
        'gear': _gear,
        'extraUserInfo': _extraUserInfo,
      };

  @override
  _i1.Table<int?> get table => FavouritesJunction.t;
}

class FavouritesJunctionIncludeList extends _i1.IncludeList {
  FavouritesJunctionIncludeList._({
    _i1.WhereExpressionBuilder<FavouritesJunctionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FavouritesJunction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => FavouritesJunction.t;
}

class FavouritesJunctionRepository {
  const FavouritesJunctionRepository._();

  final attachRow = const FavouritesJunctionAttachRowRepository._();

  /// Returns a list of [FavouritesJunction]s matching the given query parameters.
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
  Future<List<FavouritesJunction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FavouritesJunctionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FavouritesJunctionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FavouritesJunctionTable>? orderByList,
    _i1.Transaction? transaction,
    FavouritesJunctionInclude? include,
  }) async {
    return session.db.find<FavouritesJunction>(
      where: where?.call(FavouritesJunction.t),
      orderBy: orderBy?.call(FavouritesJunction.t),
      orderByList: orderByList?.call(FavouritesJunction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [FavouritesJunction] matching the given query parameters.
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
  Future<FavouritesJunction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FavouritesJunctionTable>? where,
    int? offset,
    _i1.OrderByBuilder<FavouritesJunctionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FavouritesJunctionTable>? orderByList,
    _i1.Transaction? transaction,
    FavouritesJunctionInclude? include,
  }) async {
    return session.db.findFirstRow<FavouritesJunction>(
      where: where?.call(FavouritesJunction.t),
      orderBy: orderBy?.call(FavouritesJunction.t),
      orderByList: orderByList?.call(FavouritesJunction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [FavouritesJunction] by its [id] or null if no such row exists.
  Future<FavouritesJunction?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    FavouritesJunctionInclude? include,
  }) async {
    return session.db.findById<FavouritesJunction>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [FavouritesJunction]s in the list and returns the inserted rows.
  ///
  /// The returned [FavouritesJunction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<FavouritesJunction>> insert(
    _i1.Session session,
    List<FavouritesJunction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<FavouritesJunction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [FavouritesJunction] and returns the inserted row.
  ///
  /// The returned [FavouritesJunction] will have its `id` field set.
  Future<FavouritesJunction> insertRow(
    _i1.Session session,
    FavouritesJunction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FavouritesJunction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [FavouritesJunction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<FavouritesJunction>> update(
    _i1.Session session,
    List<FavouritesJunction> rows, {
    _i1.ColumnSelections<FavouritesJunctionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FavouritesJunction>(
      rows,
      columns: columns?.call(FavouritesJunction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FavouritesJunction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FavouritesJunction> updateRow(
    _i1.Session session,
    FavouritesJunction row, {
    _i1.ColumnSelections<FavouritesJunctionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FavouritesJunction>(
      row,
      columns: columns?.call(FavouritesJunction.t),
      transaction: transaction,
    );
  }

  /// Deletes all [FavouritesJunction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<FavouritesJunction>> delete(
    _i1.Session session,
    List<FavouritesJunction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FavouritesJunction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [FavouritesJunction].
  Future<FavouritesJunction> deleteRow(
    _i1.Session session,
    FavouritesJunction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FavouritesJunction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<FavouritesJunction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FavouritesJunctionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FavouritesJunction>(
      where: where(FavouritesJunction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FavouritesJunctionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FavouritesJunction>(
      where: where?.call(FavouritesJunction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class FavouritesJunctionAttachRowRepository {
  const FavouritesJunctionAttachRowRepository._();

  /// Creates a relation between the given [FavouritesJunction] and [Gear]
  /// by setting the [FavouritesJunction]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    FavouritesJunction favouritesJunction,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.id == null) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $favouritesJunction = favouritesJunction.copyWith(gearId: gear.id);
    await session.db.updateRow<FavouritesJunction>(
      $favouritesJunction,
      columns: [FavouritesJunction.t.gearId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [FavouritesJunction] and [ExtraUserInfo]
  /// by setting the [FavouritesJunction]'s foreign key `extraUserInfoId` to refer to the [ExtraUserInfo].
  Future<void> extraUserInfo(
    _i1.Session session,
    FavouritesJunction favouritesJunction,
    _i3.ExtraUserInfo extraUserInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.id == null) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }
    if (extraUserInfo.id == null) {
      throw ArgumentError.notNull('extraUserInfo.id');
    }

    var $favouritesJunction =
        favouritesJunction.copyWith(extraUserInfoId: extraUserInfo.id);
    await session.db.updateRow<FavouritesJunction>(
      $favouritesJunction,
      columns: [FavouritesJunction.t.extraUserInfoId],
      transaction: transaction,
    );
  }
}
