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
import 'gear/gear.dart' as _i2;

abstract class GearPhoto
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GearPhoto._({
    this.id,
    this.gearId,
    this.gear,
    required this.width,
    required this.height,
    this.blurhash,
    required this.path,
  });

  factory GearPhoto({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    required int width,
    required int height,
    String? blurhash,
    required String path,
  }) = _GearPhotoImpl;

  factory GearPhoto.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearPhoto(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int?,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      width: jsonSerialization['width'] as int,
      height: jsonSerialization['height'] as int,
      blurhash: jsonSerialization['blurhash'] as String?,
      path: jsonSerialization['path'] as String,
    );
  }

  static final t = GearPhotoTable();

  static const db = GearPhotoRepository._();

  @override
  int? id;

  int? gearId;

  _i2.Gear? gear;

  int width;

  int height;

  String? blurhash;

  String path;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GearPhoto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearPhoto copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? width,
    int? height,
    String? blurhash,
    String? path,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (gearId != null) 'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'width': width,
      'height': height,
      if (blurhash != null) 'blurhash': blurhash,
      'path': path,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (gearId != null) 'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'width': width,
      'height': height,
      if (blurhash != null) 'blurhash': blurhash,
      'path': path,
    };
  }

  static GearPhotoInclude include({_i2.GearInclude? gear}) {
    return GearPhotoInclude._(gear: gear);
  }

  static GearPhotoIncludeList includeList({
    _i1.WhereExpressionBuilder<GearPhotoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearPhotoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPhotoTable>? orderByList,
    GearPhotoInclude? include,
  }) {
    return GearPhotoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GearPhoto.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GearPhoto.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearPhotoImpl extends GearPhoto {
  _GearPhotoImpl({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    required int width,
    required int height,
    String? blurhash,
    required String path,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          width: width,
          height: height,
          blurhash: blurhash,
          path: path,
        );

  /// Returns a shallow copy of this [GearPhoto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearPhoto copyWith({
    Object? id = _Undefined,
    Object? gearId = _Undefined,
    Object? gear = _Undefined,
    int? width,
    int? height,
    Object? blurhash = _Undefined,
    String? path,
  }) {
    return GearPhoto(
      id: id is int? ? id : this.id,
      gearId: gearId is int? ? gearId : this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      width: width ?? this.width,
      height: height ?? this.height,
      blurhash: blurhash is String? ? blurhash : this.blurhash,
      path: path ?? this.path,
    );
  }
}

class GearPhotoTable extends _i1.Table<int?> {
  GearPhotoTable({super.tableRelation}) : super(tableName: 'gear_photos') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    width = _i1.ColumnInt(
      'width',
      this,
    );
    height = _i1.ColumnInt(
      'height',
      this,
    );
    blurhash = _i1.ColumnString(
      'blurhash',
      this,
    );
    path = _i1.ColumnString(
      'path',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnInt width;

  late final _i1.ColumnInt height;

  late final _i1.ColumnString blurhash;

  late final _i1.ColumnString path;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: GearPhoto.t.gearId,
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
        width,
        height,
        blurhash,
        path,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    return null;
  }
}

class GearPhotoInclude extends _i1.IncludeObject {
  GearPhotoInclude._({_i2.GearInclude? gear}) {
    _gear = gear;
  }

  _i2.GearInclude? _gear;

  @override
  Map<String, _i1.Include?> get includes => {'gear': _gear};

  @override
  _i1.Table<int?> get table => GearPhoto.t;
}

class GearPhotoIncludeList extends _i1.IncludeList {
  GearPhotoIncludeList._({
    _i1.WhereExpressionBuilder<GearPhotoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GearPhoto.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GearPhoto.t;
}

class GearPhotoRepository {
  const GearPhotoRepository._();

  final attachRow = const GearPhotoAttachRowRepository._();

  final detachRow = const GearPhotoDetachRowRepository._();

  /// Returns a list of [GearPhoto]s matching the given query parameters.
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
  Future<List<GearPhoto>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPhotoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearPhotoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPhotoTable>? orderByList,
    _i1.Transaction? transaction,
    GearPhotoInclude? include,
  }) async {
    return session.db.find<GearPhoto>(
      where: where?.call(GearPhoto.t),
      orderBy: orderBy?.call(GearPhoto.t),
      orderByList: orderByList?.call(GearPhoto.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GearPhoto] matching the given query parameters.
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
  Future<GearPhoto?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPhotoTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearPhotoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearPhotoTable>? orderByList,
    _i1.Transaction? transaction,
    GearPhotoInclude? include,
  }) async {
    return session.db.findFirstRow<GearPhoto>(
      where: where?.call(GearPhoto.t),
      orderBy: orderBy?.call(GearPhoto.t),
      orderByList: orderByList?.call(GearPhoto.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GearPhoto] by its [id] or null if no such row exists.
  Future<GearPhoto?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearPhotoInclude? include,
  }) async {
    return session.db.findById<GearPhoto>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GearPhoto]s in the list and returns the inserted rows.
  ///
  /// The returned [GearPhoto]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GearPhoto>> insert(
    _i1.Session session,
    List<GearPhoto> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GearPhoto>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GearPhoto] and returns the inserted row.
  ///
  /// The returned [GearPhoto] will have its `id` field set.
  Future<GearPhoto> insertRow(
    _i1.Session session,
    GearPhoto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GearPhoto>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GearPhoto]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GearPhoto>> update(
    _i1.Session session,
    List<GearPhoto> rows, {
    _i1.ColumnSelections<GearPhotoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GearPhoto>(
      rows,
      columns: columns?.call(GearPhoto.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GearPhoto]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GearPhoto> updateRow(
    _i1.Session session,
    GearPhoto row, {
    _i1.ColumnSelections<GearPhotoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GearPhoto>(
      row,
      columns: columns?.call(GearPhoto.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GearPhoto]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GearPhoto>> delete(
    _i1.Session session,
    List<GearPhoto> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GearPhoto>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GearPhoto].
  Future<GearPhoto> deleteRow(
    _i1.Session session,
    GearPhoto row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GearPhoto>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GearPhoto>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearPhotoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GearPhoto>(
      where: where(GearPhoto.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearPhotoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GearPhoto>(
      where: where?.call(GearPhoto.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearPhotoAttachRowRepository {
  const GearPhotoAttachRowRepository._();

  /// Creates a relation between the given [GearPhoto] and [Gear]
  /// by setting the [GearPhoto]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    GearPhoto gearPhoto,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (gearPhoto.id == null) {
      throw ArgumentError.notNull('gearPhoto.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $gearPhoto = gearPhoto.copyWith(gearId: gear.id);
    await session.db.updateRow<GearPhoto>(
      $gearPhoto,
      columns: [GearPhoto.t.gearId],
      transaction: transaction,
    );
  }
}

class GearPhotoDetachRowRepository {
  const GearPhotoDetachRowRepository._();

  /// Detaches the relation between this [GearPhoto] and the [Gear] set in `gear`
  /// by setting the [GearPhoto]'s foreign key `gearId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> gear(
    _i1.Session session,
    GearPhoto gearphoto, {
    _i1.Transaction? transaction,
  }) async {
    if (gearphoto.id == null) {
      throw ArgumentError.notNull('gearphoto.id');
    }

    var $gearphoto = gearphoto.copyWith(gearId: null);
    await session.db.updateRow<GearPhoto>(
      $gearphoto,
      columns: [GearPhoto.t.gearId],
      transaction: transaction,
    );
  }
}
