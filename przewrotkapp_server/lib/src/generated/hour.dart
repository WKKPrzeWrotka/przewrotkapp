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
import 'hour_category.dart' as _i3;

abstract class Hour implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Hour._({
    this.id,
    required this.userId,
    this.user,
    required this.amount,
    required this.description,
    required this.category,
    required this.date,
    bool? approved,
  }) : approved = approved ?? false;

  factory Hour({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required int amount,
    required String description,
    required _i3.HourCategory category,
    required DateTime date,
    bool? approved,
  }) = _HourImpl;

  factory Hour.fromJson(Map<String, dynamic> jsonSerialization) {
    return Hour(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      amount: jsonSerialization['amount'] as int,
      description: jsonSerialization['description'] as String,
      category:
          _i3.HourCategory.fromJson((jsonSerialization['category'] as String)),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      approved: jsonSerialization['approved'] as bool,
    );
  }

  static final t = HourTable();

  static const db = HourRepository._();

  @override
  int? id;

  int userId;

  _i2.UserInfo? user;

  int amount;

  String description;

  _i3.HourCategory category;

  DateTime date;

  bool approved;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Hour]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Hour copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    int? amount,
    String? description,
    _i3.HourCategory? category,
    DateTime? date,
    bool? approved,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'amount': amount,
      'description': description,
      'category': category.toJson(),
      'date': date.toJson(),
      'approved': approved,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'amount': amount,
      'description': description,
      'category': category.toJson(),
      'date': date.toJson(),
      'approved': approved,
    };
  }

  static HourInclude include({_i2.UserInfoInclude? user}) {
    return HourInclude._(user: user);
  }

  static HourIncludeList includeList({
    _i1.WhereExpressionBuilder<HourTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HourTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HourTable>? orderByList,
    HourInclude? include,
  }) {
    return HourIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Hour.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Hour.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HourImpl extends Hour {
  _HourImpl({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required int amount,
    required String description,
    required _i3.HourCategory category,
    required DateTime date,
    bool? approved,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          amount: amount,
          description: description,
          category: category,
          date: date,
          approved: approved,
        );

  /// Returns a shallow copy of this [Hour]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Hour copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? amount,
    String? description,
    _i3.HourCategory? category,
    DateTime? date,
    bool? approved,
  }) {
    return Hour(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      amount: amount ?? this.amount,
      description: description ?? this.description,
      category: category ?? this.category,
      date: date ?? this.date,
      approved: approved ?? this.approved,
    );
  }
}

class HourTable extends _i1.Table<int?> {
  HourTable({super.tableRelation}) : super(tableName: 'hours') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    amount = _i1.ColumnInt(
      'amount',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    category = _i1.ColumnEnum(
      'category',
      this,
      _i1.EnumSerialization.byName,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    approved = _i1.ColumnBool(
      'approved',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserInfoTable? _user;

  late final _i1.ColumnInt amount;

  late final _i1.ColumnString description;

  late final _i1.ColumnEnum<_i3.HourCategory> category;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnBool approved;

  _i2.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Hour.t.userId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        amount,
        description,
        category,
        date,
        approved,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class HourInclude extends _i1.IncludeObject {
  HourInclude._({_i2.UserInfoInclude? user}) {
    _user = user;
  }

  _i2.UserInfoInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<int?> get table => Hour.t;
}

class HourIncludeList extends _i1.IncludeList {
  HourIncludeList._({
    _i1.WhereExpressionBuilder<HourTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Hour.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Hour.t;
}

class HourRepository {
  const HourRepository._();

  final attachRow = const HourAttachRowRepository._();

  /// Returns a list of [Hour]s matching the given query parameters.
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
  Future<List<Hour>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HourTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HourTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HourTable>? orderByList,
    _i1.Transaction? transaction,
    HourInclude? include,
  }) async {
    return session.db.find<Hour>(
      where: where?.call(Hour.t),
      orderBy: orderBy?.call(Hour.t),
      orderByList: orderByList?.call(Hour.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Hour] matching the given query parameters.
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
  Future<Hour?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HourTable>? where,
    int? offset,
    _i1.OrderByBuilder<HourTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HourTable>? orderByList,
    _i1.Transaction? transaction,
    HourInclude? include,
  }) async {
    return session.db.findFirstRow<Hour>(
      where: where?.call(Hour.t),
      orderBy: orderBy?.call(Hour.t),
      orderByList: orderByList?.call(Hour.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Hour] by its [id] or null if no such row exists.
  Future<Hour?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    HourInclude? include,
  }) async {
    return session.db.findById<Hour>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Hour]s in the list and returns the inserted rows.
  ///
  /// The returned [Hour]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Hour>> insert(
    _i1.Session session,
    List<Hour> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Hour>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Hour] and returns the inserted row.
  ///
  /// The returned [Hour] will have its `id` field set.
  Future<Hour> insertRow(
    _i1.Session session,
    Hour row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Hour>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Hour]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Hour>> update(
    _i1.Session session,
    List<Hour> rows, {
    _i1.ColumnSelections<HourTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Hour>(
      rows,
      columns: columns?.call(Hour.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Hour]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Hour> updateRow(
    _i1.Session session,
    Hour row, {
    _i1.ColumnSelections<HourTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Hour>(
      row,
      columns: columns?.call(Hour.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Hour]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Hour>> delete(
    _i1.Session session,
    List<Hour> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Hour>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Hour].
  Future<Hour> deleteRow(
    _i1.Session session,
    Hour row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Hour>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Hour>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<HourTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Hour>(
      where: where(Hour.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HourTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Hour>(
      where: where?.call(Hour.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class HourAttachRowRepository {
  const HourAttachRowRepository._();

  /// Creates a relation between the given [Hour] and [UserInfo]
  /// by setting the [Hour]'s foreign key `userId` to refer to the [UserInfo].
  Future<void> user(
    _i1.Session session,
    Hour hour,
    _i2.UserInfo user, {
    _i1.Transaction? transaction,
  }) async {
    if (hour.id == null) {
      throw ArgumentError.notNull('hour.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $hour = hour.copyWith(userId: user.id);
    await session.db.updateRow<Hour>(
      $hour,
      columns: [Hour.t.userId],
      transaction: transaction,
    );
  }
}
