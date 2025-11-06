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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../gear/gear.dart' as _i3;

abstract class FavouritesJunction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  FavouritesJunction._({
    this.id,
    required this.userId,
    this.user,
    required this.gearId,
    this.gear,
  });

  factory FavouritesJunction({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required int gearId,
    _i3.Gear? gear,
  }) = _FavouritesJunctionImpl;

  factory FavouritesJunction.fromJson(Map<String, dynamic> jsonSerialization) {
    return FavouritesJunction(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i3.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
    );
  }

  static final t = FavouritesJunctionTable();

  static const db = FavouritesJunctionRepository._();

  @override
  int? id;

  int userId;

  _i2.UserInfo? user;

  int gearId;

  _i3.Gear? gear;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [FavouritesJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FavouritesJunction copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    int? gearId,
    _i3.Gear? gear,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
    };
  }

  static FavouritesJunctionInclude include({
    _i2.UserInfoInclude? user,
    _i3.GearInclude? gear,
  }) {
    return FavouritesJunctionInclude._(
      user: user,
      gear: gear,
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
    required int userId,
    _i2.UserInfo? user,
    required int gearId,
    _i3.Gear? gear,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          gearId: gearId,
          gear: gear,
        );

  /// Returns a shallow copy of this [FavouritesJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FavouritesJunction copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
  }) {
    return FavouritesJunction(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      gearId: gearId ?? this.gearId,
      gear: gear is _i3.Gear? ? gear : this.gear?.copyWith(),
    );
  }
}

class FavouritesJunctionTable extends _i1.Table<int?> {
  FavouritesJunctionTable({super.tableRelation})
      : super(tableName: 'favourites_junctions') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserInfoTable? _user;

  late final _i1.ColumnInt gearId;

  _i3.GearTable? _gear;

  _i2.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: FavouritesJunction.t.userId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: FavouritesJunction.t.gearId,
      foreignField: _i3.Gear.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.GearTable(tableRelation: foreignTableRelation),
    );
    return _gear!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        gearId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class FavouritesJunctionInclude extends _i1.IncludeObject {
  FavouritesJunctionInclude._({
    _i2.UserInfoInclude? user,
    _i3.GearInclude? gear,
  }) {
    _user = user;
    _gear = gear;
  }

  _i2.UserInfoInclude? _user;

  _i3.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'gear': _gear,
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

  /// Creates a relation between the given [FavouritesJunction] and [UserInfo]
  /// by setting the [FavouritesJunction]'s foreign key `userId` to refer to the [UserInfo].
  Future<void> user(
    _i1.Session session,
    FavouritesJunction favouritesJunction,
    _i2.UserInfo user, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.id == null) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $favouritesJunction = favouritesJunction.copyWith(userId: user.id);
    await session.db.updateRow<FavouritesJunction>(
      $favouritesJunction,
      columns: [FavouritesJunction.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [FavouritesJunction] and [Gear]
  /// by setting the [FavouritesJunction]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    FavouritesJunction favouritesJunction,
    _i3.Gear gear, {
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
}
