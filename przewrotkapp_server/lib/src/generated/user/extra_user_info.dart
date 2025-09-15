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
import '../user/favourites.dart' as _i3;

abstract class ExtraUserInfo
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ExtraUserInfo._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    this.phoneNumber,
    this.discordUsername,
    required this.socialLinks,
    this.favouritesJunctions,
  });

  factory ExtraUserInfo({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    required Map<String, Uri> socialLinks,
    List<_i3.FavouritesJunction>? favouritesJunctions,
  }) = _ExtraUserInfoImpl;

  factory ExtraUserInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return ExtraUserInfo(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      phoneNumber: jsonSerialization['phoneNumber'] as String?,
      discordUsername: jsonSerialization['discordUsername'] as String?,
      socialLinks:
          (jsonSerialization['socialLinks'] as Map).map((k, v) => MapEntry(
                k as String,
                _i1.UriJsonExtension.fromJson(v),
              )),
      favouritesJunctions: (jsonSerialization['favouritesJunctions'] as List?)
          ?.map((e) =>
              _i3.FavouritesJunction.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = ExtraUserInfoTable();

  static const db = ExtraUserInfoRepository._();

  @override
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String? phoneNumber;

  String? discordUsername;

  Map<String, Uri> socialLinks;

  List<_i3.FavouritesJunction>? favouritesJunctions;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ExtraUserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExtraUserInfo copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    Map<String, Uri>? socialLinks,
    List<_i3.FavouritesJunction>? favouritesJunctions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (discordUsername != null) 'discordUsername': discordUsername,
      'socialLinks': socialLinks.toJson(valueToJson: (v) => v.toJson()),
      if (favouritesJunctions != null)
        'favouritesJunctions':
            favouritesJunctions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (discordUsername != null) 'discordUsername': discordUsername,
      'socialLinks': socialLinks.toJson(valueToJson: (v) => v.toJson()),
      if (favouritesJunctions != null)
        'favouritesJunctions': favouritesJunctions?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static ExtraUserInfoInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.FavouritesJunctionIncludeList? favouritesJunctions,
  }) {
    return ExtraUserInfoInclude._(
      userInfo: userInfo,
      favouritesJunctions: favouritesJunctions,
    );
  }

  static ExtraUserInfoIncludeList includeList({
    _i1.WhereExpressionBuilder<ExtraUserInfoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExtraUserInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExtraUserInfoTable>? orderByList,
    ExtraUserInfoInclude? include,
  }) {
    return ExtraUserInfoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ExtraUserInfo.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ExtraUserInfo.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ExtraUserInfoImpl extends ExtraUserInfo {
  _ExtraUserInfoImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    required Map<String, Uri> socialLinks,
    List<_i3.FavouritesJunction>? favouritesJunctions,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          phoneNumber: phoneNumber,
          discordUsername: discordUsername,
          socialLinks: socialLinks,
          favouritesJunctions: favouritesJunctions,
        );

  /// Returns a shallow copy of this [ExtraUserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExtraUserInfo copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? phoneNumber = _Undefined,
    Object? discordUsername = _Undefined,
    Map<String, Uri>? socialLinks,
    Object? favouritesJunctions = _Undefined,
  }) {
    return ExtraUserInfo(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      discordUsername:
          discordUsername is String? ? discordUsername : this.discordUsername,
      socialLinks: socialLinks ??
          this.socialLinks.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      favouritesJunctions: favouritesJunctions is List<_i3.FavouritesJunction>?
          ? favouritesJunctions
          : this.favouritesJunctions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class ExtraUserInfoTable extends _i1.Table<int?> {
  ExtraUserInfoTable({super.tableRelation})
      : super(tableName: 'extra_user_infos') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    discordUsername = _i1.ColumnString(
      'discordUsername',
      this,
    );
    socialLinks = _i1.ColumnSerializable(
      'socialLinks',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnString discordUsername;

  late final _i1.ColumnSerializable socialLinks;

  _i3.FavouritesJunctionTable? ___favouritesJunctions;

  _i1.ManyRelation<_i3.FavouritesJunctionTable>? _favouritesJunctions;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: ExtraUserInfo.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.FavouritesJunctionTable get __favouritesJunctions {
    if (___favouritesJunctions != null) return ___favouritesJunctions!;
    ___favouritesJunctions = _i1.createRelationTable(
      relationFieldName: '__favouritesJunctions',
      field: ExtraUserInfo.t.id,
      foreignField: _i3.FavouritesJunction.t.extraUserInfoId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.FavouritesJunctionTable(tableRelation: foreignTableRelation),
    );
    return ___favouritesJunctions!;
  }

  _i1.ManyRelation<_i3.FavouritesJunctionTable> get favouritesJunctions {
    if (_favouritesJunctions != null) return _favouritesJunctions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'favouritesJunctions',
      field: ExtraUserInfo.t.id,
      foreignField: _i3.FavouritesJunction.t.extraUserInfoId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.FavouritesJunctionTable(tableRelation: foreignTableRelation),
    );
    _favouritesJunctions = _i1.ManyRelation<_i3.FavouritesJunctionTable>(
      tableWithRelations: relationTable,
      table: _i3.FavouritesJunctionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _favouritesJunctions!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        phoneNumber,
        discordUsername,
        socialLinks,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'favouritesJunctions') {
      return __favouritesJunctions;
    }
    return null;
  }
}

class ExtraUserInfoInclude extends _i1.IncludeObject {
  ExtraUserInfoInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.FavouritesJunctionIncludeList? favouritesJunctions,
  }) {
    _userInfo = userInfo;
    _favouritesJunctions = favouritesJunctions;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.FavouritesJunctionIncludeList? _favouritesJunctions;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'favouritesJunctions': _favouritesJunctions,
      };

  @override
  _i1.Table<int?> get table => ExtraUserInfo.t;
}

class ExtraUserInfoIncludeList extends _i1.IncludeList {
  ExtraUserInfoIncludeList._({
    _i1.WhereExpressionBuilder<ExtraUserInfoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ExtraUserInfo.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ExtraUserInfo.t;
}

class ExtraUserInfoRepository {
  const ExtraUserInfoRepository._();

  final attach = const ExtraUserInfoAttachRepository._();

  final attachRow = const ExtraUserInfoAttachRowRepository._();

  final detach = const ExtraUserInfoDetachRepository._();

  final detachRow = const ExtraUserInfoDetachRowRepository._();

  /// Returns a list of [ExtraUserInfo]s matching the given query parameters.
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
  Future<List<ExtraUserInfo>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExtraUserInfoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExtraUserInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExtraUserInfoTable>? orderByList,
    _i1.Transaction? transaction,
    ExtraUserInfoInclude? include,
  }) async {
    return session.db.find<ExtraUserInfo>(
      where: where?.call(ExtraUserInfo.t),
      orderBy: orderBy?.call(ExtraUserInfo.t),
      orderByList: orderByList?.call(ExtraUserInfo.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ExtraUserInfo] matching the given query parameters.
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
  Future<ExtraUserInfo?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExtraUserInfoTable>? where,
    int? offset,
    _i1.OrderByBuilder<ExtraUserInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExtraUserInfoTable>? orderByList,
    _i1.Transaction? transaction,
    ExtraUserInfoInclude? include,
  }) async {
    return session.db.findFirstRow<ExtraUserInfo>(
      where: where?.call(ExtraUserInfo.t),
      orderBy: orderBy?.call(ExtraUserInfo.t),
      orderByList: orderByList?.call(ExtraUserInfo.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ExtraUserInfo] by its [id] or null if no such row exists.
  Future<ExtraUserInfo?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ExtraUserInfoInclude? include,
  }) async {
    return session.db.findById<ExtraUserInfo>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ExtraUserInfo]s in the list and returns the inserted rows.
  ///
  /// The returned [ExtraUserInfo]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ExtraUserInfo>> insert(
    _i1.Session session,
    List<ExtraUserInfo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ExtraUserInfo>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ExtraUserInfo] and returns the inserted row.
  ///
  /// The returned [ExtraUserInfo] will have its `id` field set.
  Future<ExtraUserInfo> insertRow(
    _i1.Session session,
    ExtraUserInfo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ExtraUserInfo>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ExtraUserInfo]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ExtraUserInfo>> update(
    _i1.Session session,
    List<ExtraUserInfo> rows, {
    _i1.ColumnSelections<ExtraUserInfoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ExtraUserInfo>(
      rows,
      columns: columns?.call(ExtraUserInfo.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ExtraUserInfo]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ExtraUserInfo> updateRow(
    _i1.Session session,
    ExtraUserInfo row, {
    _i1.ColumnSelections<ExtraUserInfoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ExtraUserInfo>(
      row,
      columns: columns?.call(ExtraUserInfo.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ExtraUserInfo]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ExtraUserInfo>> delete(
    _i1.Session session,
    List<ExtraUserInfo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ExtraUserInfo>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ExtraUserInfo].
  Future<ExtraUserInfo> deleteRow(
    _i1.Session session,
    ExtraUserInfo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ExtraUserInfo>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ExtraUserInfo>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExtraUserInfoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ExtraUserInfo>(
      where: where(ExtraUserInfo.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExtraUserInfoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ExtraUserInfo>(
      where: where?.call(ExtraUserInfo.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ExtraUserInfoAttachRepository {
  const ExtraUserInfoAttachRepository._();

  /// Creates a relation between this [ExtraUserInfo] and the given [FavouritesJunction]s
  /// by setting each [FavouritesJunction]'s foreign key `extraUserInfoId` to refer to this [ExtraUserInfo].
  Future<void> favouritesJunctions(
    _i1.Session session,
    ExtraUserInfo extraUserInfo,
    List<_i3.FavouritesJunction> favouritesJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.any((e) => e.id == null)) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }
    if (extraUserInfo.id == null) {
      throw ArgumentError.notNull('extraUserInfo.id');
    }

    var $favouritesJunction = favouritesJunction
        .map((e) => e.copyWith(extraUserInfoId: extraUserInfo.id))
        .toList();
    await session.db.update<_i3.FavouritesJunction>(
      $favouritesJunction,
      columns: [_i3.FavouritesJunction.t.extraUserInfoId],
      transaction: transaction,
    );
  }
}

class ExtraUserInfoAttachRowRepository {
  const ExtraUserInfoAttachRowRepository._();

  /// Creates a relation between the given [ExtraUserInfo] and [UserInfo]
  /// by setting the [ExtraUserInfo]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    ExtraUserInfo extraUserInfo,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (extraUserInfo.id == null) {
      throw ArgumentError.notNull('extraUserInfo.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $extraUserInfo = extraUserInfo.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<ExtraUserInfo>(
      $extraUserInfo,
      columns: [ExtraUserInfo.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ExtraUserInfo] and the given [FavouritesJunction]
  /// by setting the [FavouritesJunction]'s foreign key `extraUserInfoId` to refer to this [ExtraUserInfo].
  Future<void> favouritesJunctions(
    _i1.Session session,
    ExtraUserInfo extraUserInfo,
    _i3.FavouritesJunction favouritesJunction, {
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
    await session.db.updateRow<_i3.FavouritesJunction>(
      $favouritesJunction,
      columns: [_i3.FavouritesJunction.t.extraUserInfoId],
      transaction: transaction,
    );
  }
}

class ExtraUserInfoDetachRepository {
  const ExtraUserInfoDetachRepository._();

  /// Detaches the relation between this [ExtraUserInfo] and the given [FavouritesJunction]
  /// by setting the [FavouritesJunction]'s foreign key `extraUserInfoId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> favouritesJunctions(
    _i1.Session session,
    List<_i3.FavouritesJunction> favouritesJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.any((e) => e.id == null)) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }

    var $favouritesJunction = favouritesJunction
        .map((e) => e.copyWith(extraUserInfoId: null))
        .toList();
    await session.db.update<_i3.FavouritesJunction>(
      $favouritesJunction,
      columns: [_i3.FavouritesJunction.t.extraUserInfoId],
      transaction: transaction,
    );
  }
}

class ExtraUserInfoDetachRowRepository {
  const ExtraUserInfoDetachRowRepository._();

  /// Detaches the relation between this [ExtraUserInfo] and the given [FavouritesJunction]
  /// by setting the [FavouritesJunction]'s foreign key `extraUserInfoId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> favouritesJunctions(
    _i1.Session session,
    _i3.FavouritesJunction favouritesJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.id == null) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }

    var $favouritesJunction =
        favouritesJunction.copyWith(extraUserInfoId: null);
    await session.db.updateRow<_i3.FavouritesJunction>(
      $favouritesJunction,
      columns: [_i3.FavouritesJunction.t.extraUserInfoId],
      transaction: transaction,
    );
  }
}
