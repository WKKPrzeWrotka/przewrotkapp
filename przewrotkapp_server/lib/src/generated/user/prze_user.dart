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

abstract class PrzeUser
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PrzeUser._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    this.phoneNumber,
    this.discordUsername,
    required this.socialLinks,
  });

  factory PrzeUser({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    required Map<String, Uri> socialLinks,
  }) = _PrzeUserImpl;

  factory PrzeUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return PrzeUser(
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
    );
  }

  static final t = PrzeUserTable();

  static const db = PrzeUserRepository._();

  @override
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String? phoneNumber;

  String? discordUsername;

  Map<String, Uri> socialLinks;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PrzeUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PrzeUser copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    Map<String, Uri>? socialLinks,
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
    };
  }

  static PrzeUserInclude include({_i2.UserInfoInclude? userInfo}) {
    return PrzeUserInclude._(userInfo: userInfo);
  }

  static PrzeUserIncludeList includeList({
    _i1.WhereExpressionBuilder<PrzeUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PrzeUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PrzeUserTable>? orderByList,
    PrzeUserInclude? include,
  }) {
    return PrzeUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PrzeUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PrzeUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PrzeUserImpl extends PrzeUser {
  _PrzeUserImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    required Map<String, Uri> socialLinks,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          phoneNumber: phoneNumber,
          discordUsername: discordUsername,
          socialLinks: socialLinks,
        );

  /// Returns a shallow copy of this [PrzeUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PrzeUser copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? phoneNumber = _Undefined,
    Object? discordUsername = _Undefined,
    Map<String, Uri>? socialLinks,
  }) {
    return PrzeUser(
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
    );
  }
}

class PrzeUserTable extends _i1.Table<int?> {
  PrzeUserTable({super.tableRelation}) : super(tableName: 'prze_users') {
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

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: PrzeUser.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
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
    return null;
  }
}

class PrzeUserInclude extends _i1.IncludeObject {
  PrzeUserInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table<int?> get table => PrzeUser.t;
}

class PrzeUserIncludeList extends _i1.IncludeList {
  PrzeUserIncludeList._({
    _i1.WhereExpressionBuilder<PrzeUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PrzeUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PrzeUser.t;
}

class PrzeUserRepository {
  const PrzeUserRepository._();

  final attachRow = const PrzeUserAttachRowRepository._();

  /// Returns a list of [PrzeUser]s matching the given query parameters.
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
  Future<List<PrzeUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PrzeUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PrzeUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PrzeUserTable>? orderByList,
    _i1.Transaction? transaction,
    PrzeUserInclude? include,
  }) async {
    return session.db.find<PrzeUser>(
      where: where?.call(PrzeUser.t),
      orderBy: orderBy?.call(PrzeUser.t),
      orderByList: orderByList?.call(PrzeUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PrzeUser] matching the given query parameters.
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
  Future<PrzeUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PrzeUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<PrzeUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PrzeUserTable>? orderByList,
    _i1.Transaction? transaction,
    PrzeUserInclude? include,
  }) async {
    return session.db.findFirstRow<PrzeUser>(
      where: where?.call(PrzeUser.t),
      orderBy: orderBy?.call(PrzeUser.t),
      orderByList: orderByList?.call(PrzeUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PrzeUser] by its [id] or null if no such row exists.
  Future<PrzeUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PrzeUserInclude? include,
  }) async {
    return session.db.findById<PrzeUser>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PrzeUser]s in the list and returns the inserted rows.
  ///
  /// The returned [PrzeUser]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PrzeUser>> insert(
    _i1.Session session,
    List<PrzeUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PrzeUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PrzeUser] and returns the inserted row.
  ///
  /// The returned [PrzeUser] will have its `id` field set.
  Future<PrzeUser> insertRow(
    _i1.Session session,
    PrzeUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PrzeUser>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PrzeUser]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PrzeUser>> update(
    _i1.Session session,
    List<PrzeUser> rows, {
    _i1.ColumnSelections<PrzeUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PrzeUser>(
      rows,
      columns: columns?.call(PrzeUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PrzeUser]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PrzeUser> updateRow(
    _i1.Session session,
    PrzeUser row, {
    _i1.ColumnSelections<PrzeUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PrzeUser>(
      row,
      columns: columns?.call(PrzeUser.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PrzeUser]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PrzeUser>> delete(
    _i1.Session session,
    List<PrzeUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PrzeUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PrzeUser].
  Future<PrzeUser> deleteRow(
    _i1.Session session,
    PrzeUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PrzeUser>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PrzeUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PrzeUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PrzeUser>(
      where: where(PrzeUser.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PrzeUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PrzeUser>(
      where: where?.call(PrzeUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PrzeUserAttachRowRepository {
  const PrzeUserAttachRowRepository._();

  /// Creates a relation between the given [PrzeUser] and [UserInfo]
  /// by setting the [PrzeUser]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    PrzeUser przeUser,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (przeUser.id == null) {
      throw ArgumentError.notNull('przeUser.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $przeUser = przeUser.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<PrzeUser>(
      $przeUser,
      columns: [PrzeUser.t.userInfoId],
      transaction: transaction,
    );
  }
}
