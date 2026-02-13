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
import '../gear/comment_type.dart' as _i4;

abstract class Comment
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Comment._({
    this.id,
    required this.byId,
    this.by,
    DateTime? dateCreated,
    this.gearId,
    this.gear,
    required this.type,
    required this.text,
    this.hoursForResolving,
    bool? resolved,
    this.resolvedById,
    this.resolvedBy,
    this.dateResolved,
  })  : dateCreated = dateCreated ?? DateTime.parse('2025-08-30T12:00:00.000Z'),
        resolved = resolved ?? false;

  factory Comment({
    int? id,
    required int byId,
    _i2.UserInfo? by,
    DateTime? dateCreated,
    int? gearId,
    _i3.Gear? gear,
    required _i4.CommentType type,
    required String text,
    int? hoursForResolving,
    bool? resolved,
    int? resolvedById,
    _i2.UserInfo? resolvedBy,
    DateTime? dateResolved,
  }) = _CommentImpl;

  factory Comment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Comment(
      id: jsonSerialization['id'] as int?,
      byId: jsonSerialization['byId'] as int,
      by: jsonSerialization['by'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['by'] as Map<String, dynamic>)),
      dateCreated:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateCreated']),
      gearId: jsonSerialization['gearId'] as int?,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i3.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      type: _i4.CommentType.fromJson((jsonSerialization['type'] as String)),
      text: jsonSerialization['text'] as String,
      hoursForResolving: jsonSerialization['hoursForResolving'] as int?,
      resolved: jsonSerialization['resolved'] as bool,
      resolvedById: jsonSerialization['resolvedById'] as int?,
      resolvedBy: jsonSerialization['resolvedBy'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['resolvedBy'] as Map<String, dynamic>)),
      dateResolved: jsonSerialization['dateResolved'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateResolved']),
    );
  }

  static final t = CommentTable();

  static const db = CommentRepository._();

  @override
  int? id;

  int byId;

  _i2.UserInfo? by;

  DateTime dateCreated;

  int? gearId;

  _i3.Gear? gear;

  _i4.CommentType type;

  String text;

  int? hoursForResolving;

  bool resolved;

  int? resolvedById;

  _i2.UserInfo? resolvedBy;

  DateTime? dateResolved;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Comment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Comment copyWith({
    int? id,
    int? byId,
    _i2.UserInfo? by,
    DateTime? dateCreated,
    int? gearId,
    _i3.Gear? gear,
    _i4.CommentType? type,
    String? text,
    int? hoursForResolving,
    bool? resolved,
    int? resolvedById,
    _i2.UserInfo? resolvedBy,
    DateTime? dateResolved,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'byId': byId,
      if (by != null) 'by': by?.toJson(),
      'dateCreated': dateCreated.toJson(),
      if (gearId != null) 'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'type': type.toJson(),
      'text': text,
      if (hoursForResolving != null) 'hoursForResolving': hoursForResolving,
      'resolved': resolved,
      if (resolvedById != null) 'resolvedById': resolvedById,
      if (resolvedBy != null) 'resolvedBy': resolvedBy?.toJson(),
      if (dateResolved != null) 'dateResolved': dateResolved?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'byId': byId,
      if (by != null) 'by': by?.toJsonForProtocol(),
      'dateCreated': dateCreated.toJson(),
      if (gearId != null) 'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'type': type.toJson(),
      'text': text,
      if (hoursForResolving != null) 'hoursForResolving': hoursForResolving,
      'resolved': resolved,
      if (resolvedById != null) 'resolvedById': resolvedById,
      if (resolvedBy != null) 'resolvedBy': resolvedBy?.toJsonForProtocol(),
      if (dateResolved != null) 'dateResolved': dateResolved?.toJson(),
    };
  }

  static CommentInclude include({
    _i2.UserInfoInclude? by,
    _i3.GearInclude? gear,
    _i2.UserInfoInclude? resolvedBy,
  }) {
    return CommentInclude._(
      by: by,
      gear: gear,
      resolvedBy: resolvedBy,
    );
  }

  static CommentIncludeList includeList({
    _i1.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommentTable>? orderByList,
    CommentInclude? include,
  }) {
    return CommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Comment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Comment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommentImpl extends Comment {
  _CommentImpl({
    int? id,
    required int byId,
    _i2.UserInfo? by,
    DateTime? dateCreated,
    int? gearId,
    _i3.Gear? gear,
    required _i4.CommentType type,
    required String text,
    int? hoursForResolving,
    bool? resolved,
    int? resolvedById,
    _i2.UserInfo? resolvedBy,
    DateTime? dateResolved,
  }) : super._(
          id: id,
          byId: byId,
          by: by,
          dateCreated: dateCreated,
          gearId: gearId,
          gear: gear,
          type: type,
          text: text,
          hoursForResolving: hoursForResolving,
          resolved: resolved,
          resolvedById: resolvedById,
          resolvedBy: resolvedBy,
          dateResolved: dateResolved,
        );

  /// Returns a shallow copy of this [Comment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Comment copyWith({
    Object? id = _Undefined,
    int? byId,
    Object? by = _Undefined,
    DateTime? dateCreated,
    Object? gearId = _Undefined,
    Object? gear = _Undefined,
    _i4.CommentType? type,
    String? text,
    Object? hoursForResolving = _Undefined,
    bool? resolved,
    Object? resolvedById = _Undefined,
    Object? resolvedBy = _Undefined,
    Object? dateResolved = _Undefined,
  }) {
    return Comment(
      id: id is int? ? id : this.id,
      byId: byId ?? this.byId,
      by: by is _i2.UserInfo? ? by : this.by?.copyWith(),
      dateCreated: dateCreated ?? this.dateCreated,
      gearId: gearId is int? ? gearId : this.gearId,
      gear: gear is _i3.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      text: text ?? this.text,
      hoursForResolving: hoursForResolving is int?
          ? hoursForResolving
          : this.hoursForResolving,
      resolved: resolved ?? this.resolved,
      resolvedById: resolvedById is int? ? resolvedById : this.resolvedById,
      resolvedBy: resolvedBy is _i2.UserInfo?
          ? resolvedBy
          : this.resolvedBy?.copyWith(),
      dateResolved:
          dateResolved is DateTime? ? dateResolved : this.dateResolved,
    );
  }
}

class CommentTable extends _i1.Table<int?> {
  CommentTable({super.tableRelation}) : super(tableName: 'comments') {
    byId = _i1.ColumnInt(
      'byId',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
      hasDefault: true,
    );
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    hoursForResolving = _i1.ColumnInt(
      'hoursForResolving',
      this,
    );
    resolved = _i1.ColumnBool(
      'resolved',
      this,
      hasDefault: true,
    );
    resolvedById = _i1.ColumnInt(
      'resolvedById',
      this,
    );
    dateResolved = _i1.ColumnDateTime(
      'dateResolved',
      this,
    );
  }

  late final _i1.ColumnInt byId;

  _i2.UserInfoTable? _by;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnInt gearId;

  _i3.GearTable? _gear;

  late final _i1.ColumnEnum<_i4.CommentType> type;

  late final _i1.ColumnString text;

  late final _i1.ColumnInt hoursForResolving;

  late final _i1.ColumnBool resolved;

  late final _i1.ColumnInt resolvedById;

  _i2.UserInfoTable? _resolvedBy;

  late final _i1.ColumnDateTime dateResolved;

  _i2.UserInfoTable get by {
    if (_by != null) return _by!;
    _by = _i1.createRelationTable(
      relationFieldName: 'by',
      field: Comment.t.byId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _by!;
  }

  _i3.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: Comment.t.gearId,
      foreignField: _i3.Gear.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.GearTable(tableRelation: foreignTableRelation),
    );
    return _gear!;
  }

  _i2.UserInfoTable get resolvedBy {
    if (_resolvedBy != null) return _resolvedBy!;
    _resolvedBy = _i1.createRelationTable(
      relationFieldName: 'resolvedBy',
      field: Comment.t.resolvedById,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _resolvedBy!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        byId,
        dateCreated,
        gearId,
        type,
        text,
        hoursForResolving,
        resolved,
        resolvedById,
        dateResolved,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'by') {
      return by;
    }
    if (relationField == 'gear') {
      return gear;
    }
    if (relationField == 'resolvedBy') {
      return resolvedBy;
    }
    return null;
  }
}

class CommentInclude extends _i1.IncludeObject {
  CommentInclude._({
    _i2.UserInfoInclude? by,
    _i3.GearInclude? gear,
    _i2.UserInfoInclude? resolvedBy,
  }) {
    _by = by;
    _gear = gear;
    _resolvedBy = resolvedBy;
  }

  _i2.UserInfoInclude? _by;

  _i3.GearInclude? _gear;

  _i2.UserInfoInclude? _resolvedBy;

  @override
  Map<String, _i1.Include?> get includes => {
        'by': _by,
        'gear': _gear,
        'resolvedBy': _resolvedBy,
      };

  @override
  _i1.Table<int?> get table => Comment.t;
}

class CommentIncludeList extends _i1.IncludeList {
  CommentIncludeList._({
    _i1.WhereExpressionBuilder<CommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Comment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Comment.t;
}

class CommentRepository {
  const CommentRepository._();

  final attachRow = const CommentAttachRowRepository._();

  final detachRow = const CommentDetachRowRepository._();

  /// Returns a list of [Comment]s matching the given query parameters.
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
  Future<List<Comment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommentTable>? orderByList,
    _i1.Transaction? transaction,
    CommentInclude? include,
  }) async {
    return session.db.find<Comment>(
      where: where?.call(Comment.t),
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Comment] matching the given query parameters.
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
  Future<Comment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommentTable>? where,
    int? offset,
    _i1.OrderByBuilder<CommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommentTable>? orderByList,
    _i1.Transaction? transaction,
    CommentInclude? include,
  }) async {
    return session.db.findFirstRow<Comment>(
      where: where?.call(Comment.t),
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Comment] by its [id] or null if no such row exists.
  Future<Comment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CommentInclude? include,
  }) async {
    return session.db.findById<Comment>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Comment]s in the list and returns the inserted rows.
  ///
  /// The returned [Comment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Comment>> insert(
    _i1.Session session,
    List<Comment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Comment>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Comment] and returns the inserted row.
  ///
  /// The returned [Comment] will have its `id` field set.
  Future<Comment> insertRow(
    _i1.Session session,
    Comment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Comment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Comment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Comment>> update(
    _i1.Session session,
    List<Comment> rows, {
    _i1.ColumnSelections<CommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Comment>(
      rows,
      columns: columns?.call(Comment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Comment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Comment> updateRow(
    _i1.Session session,
    Comment row, {
    _i1.ColumnSelections<CommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Comment>(
      row,
      columns: columns?.call(Comment.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Comment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Comment>> delete(
    _i1.Session session,
    List<Comment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Comment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Comment].
  Future<Comment> deleteRow(
    _i1.Session session,
    Comment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Comment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Comment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CommentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Comment>(
      where: where(Comment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Comment>(
      where: where?.call(Comment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CommentAttachRowRepository {
  const CommentAttachRowRepository._();

  /// Creates a relation between the given [Comment] and [UserInfo]
  /// by setting the [Comment]'s foreign key `byId` to refer to the [UserInfo].
  Future<void> by(
    _i1.Session session,
    Comment comment,
    _i2.UserInfo by, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }
    if (by.id == null) {
      throw ArgumentError.notNull('by.id');
    }

    var $comment = comment.copyWith(byId: by.id);
    await session.db.updateRow<Comment>(
      $comment,
      columns: [Comment.t.byId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Comment] and [Gear]
  /// by setting the [Comment]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    Comment comment,
    _i3.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $comment = comment.copyWith(gearId: gear.id);
    await session.db.updateRow<Comment>(
      $comment,
      columns: [Comment.t.gearId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Comment] and [UserInfo]
  /// by setting the [Comment]'s foreign key `resolvedById` to refer to the [UserInfo].
  Future<void> resolvedBy(
    _i1.Session session,
    Comment comment,
    _i2.UserInfo resolvedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }
    if (resolvedBy.id == null) {
      throw ArgumentError.notNull('resolvedBy.id');
    }

    var $comment = comment.copyWith(resolvedById: resolvedBy.id);
    await session.db.updateRow<Comment>(
      $comment,
      columns: [Comment.t.resolvedById],
      transaction: transaction,
    );
  }
}

class CommentDetachRowRepository {
  const CommentDetachRowRepository._();

  /// Detaches the relation between this [Comment] and the [Gear] set in `gear`
  /// by setting the [Comment]'s foreign key `gearId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> gear(
    _i1.Session session,
    Comment comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }

    var $comment = comment.copyWith(gearId: null);
    await session.db.updateRow<Comment>(
      $comment,
      columns: [Comment.t.gearId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Comment] and the [UserInfo] set in `resolvedBy`
  /// by setting the [Comment]'s foreign key `resolvedById` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> resolvedBy(
    _i1.Session session,
    Comment comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }

    var $comment = comment.copyWith(resolvedById: null);
    await session.db.updateRow<Comment>(
      $comment,
      columns: [Comment.t.resolvedById],
      transaction: transaction,
    );
  }
}
