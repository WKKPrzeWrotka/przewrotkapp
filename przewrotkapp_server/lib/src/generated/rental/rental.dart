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
import '../rental/rental_junction.dart' as _i3;

abstract class Rental implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Rental._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.created,
    required this.lastModified,
    required this.from,
    required this.to,
    this.junctions,
  });

  factory Rental({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required DateTime created,
    required DateTime lastModified,
    required DateTime from,
    required DateTime to,
    List<_i3.RentalJunction>? junctions,
  }) = _RentalImpl;

  factory Rental.fromJson(Map<String, dynamic> jsonSerialization) {
    return Rental(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      created: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
      lastModified:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastModified']),
      from: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['from']),
      to: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['to']),
      junctions: (jsonSerialization['junctions'] as List?)
          ?.map((e) => _i3.RentalJunction.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = RentalTable();

  static const db = RentalRepository._();

  @override
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  DateTime created;

  DateTime lastModified;

  DateTime from;

  DateTime to;

  List<_i3.RentalJunction>? junctions;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Rental]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Rental copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    DateTime? created,
    DateTime? lastModified,
    DateTime? from,
    DateTime? to,
    List<_i3.RentalJunction>? junctions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'created': created.toJson(),
      'lastModified': lastModified.toJson(),
      'from': from.toJson(),
      'to': to.toJson(),
      if (junctions != null)
        'junctions': junctions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'created': created.toJson(),
      'lastModified': lastModified.toJson(),
      'from': from.toJson(),
      'to': to.toJson(),
      if (junctions != null)
        'junctions':
            junctions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static RentalInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.RentalJunctionIncludeList? junctions,
  }) {
    return RentalInclude._(
      userInfo: userInfo,
      junctions: junctions,
    );
  }

  static RentalIncludeList includeList({
    _i1.WhereExpressionBuilder<RentalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RentalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RentalTable>? orderByList,
    RentalInclude? include,
  }) {
    return RentalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Rental.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Rental.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RentalImpl extends Rental {
  _RentalImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required DateTime created,
    required DateTime lastModified,
    required DateTime from,
    required DateTime to,
    List<_i3.RentalJunction>? junctions,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          created: created,
          lastModified: lastModified,
          from: from,
          to: to,
          junctions: junctions,
        );

  /// Returns a shallow copy of this [Rental]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Rental copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    DateTime? created,
    DateTime? lastModified,
    DateTime? from,
    DateTime? to,
    Object? junctions = _Undefined,
  }) {
    return Rental(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      created: created ?? this.created,
      lastModified: lastModified ?? this.lastModified,
      from: from ?? this.from,
      to: to ?? this.to,
      junctions: junctions is List<_i3.RentalJunction>?
          ? junctions
          : this.junctions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class RentalTable extends _i1.Table<int?> {
  RentalTable({super.tableRelation}) : super(tableName: 'rentals') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    created = _i1.ColumnDateTime(
      'created',
      this,
    );
    lastModified = _i1.ColumnDateTime(
      'lastModified',
      this,
    );
    from = _i1.ColumnDateTime(
      'from',
      this,
    );
    to = _i1.ColumnDateTime(
      'to',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnDateTime created;

  late final _i1.ColumnDateTime lastModified;

  late final _i1.ColumnDateTime from;

  late final _i1.ColumnDateTime to;

  _i3.RentalJunctionTable? ___junctions;

  _i1.ManyRelation<_i3.RentalJunctionTable>? _junctions;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: Rental.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.RentalJunctionTable get __junctions {
    if (___junctions != null) return ___junctions!;
    ___junctions = _i1.createRelationTable(
      relationFieldName: '__junctions',
      field: Rental.t.id,
      foreignField: _i3.RentalJunction.t.rentalId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.RentalJunctionTable(tableRelation: foreignTableRelation),
    );
    return ___junctions!;
  }

  _i1.ManyRelation<_i3.RentalJunctionTable> get junctions {
    if (_junctions != null) return _junctions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'junctions',
      field: Rental.t.id,
      foreignField: _i3.RentalJunction.t.rentalId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.RentalJunctionTable(tableRelation: foreignTableRelation),
    );
    _junctions = _i1.ManyRelation<_i3.RentalJunctionTable>(
      tableWithRelations: relationTable,
      table: _i3.RentalJunctionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _junctions!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        created,
        lastModified,
        from,
        to,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'junctions') {
      return __junctions;
    }
    return null;
  }
}

class RentalInclude extends _i1.IncludeObject {
  RentalInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.RentalJunctionIncludeList? junctions,
  }) {
    _userInfo = userInfo;
    _junctions = junctions;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.RentalJunctionIncludeList? _junctions;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'junctions': _junctions,
      };

  @override
  _i1.Table<int?> get table => Rental.t;
}

class RentalIncludeList extends _i1.IncludeList {
  RentalIncludeList._({
    _i1.WhereExpressionBuilder<RentalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Rental.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Rental.t;
}

class RentalRepository {
  const RentalRepository._();

  final attach = const RentalAttachRepository._();

  final attachRow = const RentalAttachRowRepository._();

  final detach = const RentalDetachRepository._();

  final detachRow = const RentalDetachRowRepository._();

  /// Returns a list of [Rental]s matching the given query parameters.
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
  Future<List<Rental>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RentalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RentalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RentalTable>? orderByList,
    _i1.Transaction? transaction,
    RentalInclude? include,
  }) async {
    return session.db.find<Rental>(
      where: where?.call(Rental.t),
      orderBy: orderBy?.call(Rental.t),
      orderByList: orderByList?.call(Rental.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Rental] matching the given query parameters.
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
  Future<Rental?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RentalTable>? where,
    int? offset,
    _i1.OrderByBuilder<RentalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RentalTable>? orderByList,
    _i1.Transaction? transaction,
    RentalInclude? include,
  }) async {
    return session.db.findFirstRow<Rental>(
      where: where?.call(Rental.t),
      orderBy: orderBy?.call(Rental.t),
      orderByList: orderByList?.call(Rental.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Rental] by its [id] or null if no such row exists.
  Future<Rental?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RentalInclude? include,
  }) async {
    return session.db.findById<Rental>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Rental]s in the list and returns the inserted rows.
  ///
  /// The returned [Rental]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Rental>> insert(
    _i1.Session session,
    List<Rental> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Rental>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Rental] and returns the inserted row.
  ///
  /// The returned [Rental] will have its `id` field set.
  Future<Rental> insertRow(
    _i1.Session session,
    Rental row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Rental>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Rental]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Rental>> update(
    _i1.Session session,
    List<Rental> rows, {
    _i1.ColumnSelections<RentalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Rental>(
      rows,
      columns: columns?.call(Rental.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Rental]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Rental> updateRow(
    _i1.Session session,
    Rental row, {
    _i1.ColumnSelections<RentalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Rental>(
      row,
      columns: columns?.call(Rental.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Rental]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Rental>> delete(
    _i1.Session session,
    List<Rental> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Rental>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Rental].
  Future<Rental> deleteRow(
    _i1.Session session,
    Rental row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Rental>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Rental>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RentalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Rental>(
      where: where(Rental.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RentalTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Rental>(
      where: where?.call(Rental.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RentalAttachRepository {
  const RentalAttachRepository._();

  /// Creates a relation between this [Rental] and the given [RentalJunction]s
  /// by setting each [RentalJunction]'s foreign key `rentalId` to refer to this [Rental].
  Future<void> junctions(
    _i1.Session session,
    Rental rental,
    List<_i3.RentalJunction> rentalJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (rentalJunction.any((e) => e.id == null)) {
      throw ArgumentError.notNull('rentalJunction.id');
    }
    if (rental.id == null) {
      throw ArgumentError.notNull('rental.id');
    }

    var $rentalJunction =
        rentalJunction.map((e) => e.copyWith(rentalId: rental.id)).toList();
    await session.db.update<_i3.RentalJunction>(
      $rentalJunction,
      columns: [_i3.RentalJunction.t.rentalId],
      transaction: transaction,
    );
  }
}

class RentalAttachRowRepository {
  const RentalAttachRowRepository._();

  /// Creates a relation between the given [Rental] and [UserInfo]
  /// by setting the [Rental]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    Rental rental,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (rental.id == null) {
      throw ArgumentError.notNull('rental.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $rental = rental.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<Rental>(
      $rental,
      columns: [Rental.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Rental] and the given [RentalJunction]
  /// by setting the [RentalJunction]'s foreign key `rentalId` to refer to this [Rental].
  Future<void> junctions(
    _i1.Session session,
    Rental rental,
    _i3.RentalJunction rentalJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (rentalJunction.id == null) {
      throw ArgumentError.notNull('rentalJunction.id');
    }
    if (rental.id == null) {
      throw ArgumentError.notNull('rental.id');
    }

    var $rentalJunction = rentalJunction.copyWith(rentalId: rental.id);
    await session.db.updateRow<_i3.RentalJunction>(
      $rentalJunction,
      columns: [_i3.RentalJunction.t.rentalId],
      transaction: transaction,
    );
  }
}

class RentalDetachRepository {
  const RentalDetachRepository._();

  /// Detaches the relation between this [Rental] and the given [RentalJunction]
  /// by setting the [RentalJunction]'s foreign key `rentalId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> junctions(
    _i1.Session session,
    List<_i3.RentalJunction> rentalJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (rentalJunction.any((e) => e.id == null)) {
      throw ArgumentError.notNull('rentalJunction.id');
    }

    var $rentalJunction =
        rentalJunction.map((e) => e.copyWith(rentalId: null)).toList();
    await session.db.update<_i3.RentalJunction>(
      $rentalJunction,
      columns: [_i3.RentalJunction.t.rentalId],
      transaction: transaction,
    );
  }
}

class RentalDetachRowRepository {
  const RentalDetachRowRepository._();

  /// Detaches the relation between this [Rental] and the given [RentalJunction]
  /// by setting the [RentalJunction]'s foreign key `rentalId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> junctions(
    _i1.Session session,
    _i3.RentalJunction rentalJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (rentalJunction.id == null) {
      throw ArgumentError.notNull('rentalJunction.id');
    }

    var $rentalJunction = rentalJunction.copyWith(rentalId: null);
    await session.db.updateRow<_i3.RentalJunction>(
      $rentalJunction,
      columns: [_i3.RentalJunction.t.rentalId],
      transaction: transaction,
    );
  }
}
