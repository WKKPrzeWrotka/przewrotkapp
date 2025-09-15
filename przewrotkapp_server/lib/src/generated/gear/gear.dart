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
import '../gear/gear_type.dart' as _i2;
import '../rental/rental_junction.dart' as _i3;
import '../user/favourites.dart' as _i4;

abstract class Gear implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Gear._({
    this.id,
    required this.clubId,
    required this.type,
    this.manufacturer,
    this.model,
    this.friendlyName,
    this.photoUrls,
    this.junctions,
    this.favouritesJunctions,
  });

  factory Gear({
    int? id,
    required String clubId,
    required _i2.GearType type,
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
    List<_i3.RentalJunction>? junctions,
    List<_i4.FavouritesJunction>? favouritesJunctions,
  }) = _GearImpl;

  factory Gear.fromJson(Map<String, dynamic> jsonSerialization) {
    return Gear(
      id: jsonSerialization['id'] as int?,
      clubId: jsonSerialization['clubId'] as String,
      type: _i2.GearType.fromJson((jsonSerialization['type'] as String)),
      manufacturer: jsonSerialization['manufacturer'] as String?,
      model: jsonSerialization['model'] as String?,
      friendlyName: jsonSerialization['friendlyName'] as String?,
      photoUrls: (jsonSerialization['photoUrls'] as List?)
          ?.map((e) => _i1.UriJsonExtension.fromJson(e))
          .toList(),
      junctions: (jsonSerialization['junctions'] as List?)
          ?.map((e) => _i3.RentalJunction.fromJson((e as Map<String, dynamic>)))
          .toList(),
      favouritesJunctions: (jsonSerialization['favouritesJunctions'] as List?)
          ?.map((e) =>
              _i4.FavouritesJunction.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = GearTable();

  static const db = GearRepository._();

  @override
  int? id;

  String clubId;

  _i2.GearType type;

  String? manufacturer;

  String? model;

  String? friendlyName;

  List<Uri>? photoUrls;

  List<_i3.RentalJunction>? junctions;

  List<_i4.FavouritesJunction>? favouritesJunctions;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Gear]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Gear copyWith({
    int? id,
    String? clubId,
    _i2.GearType? type,
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
    List<_i3.RentalJunction>? junctions,
    List<_i4.FavouritesJunction>? favouritesJunctions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'clubId': clubId,
      'type': type.toJson(),
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (model != null) 'model': model,
      if (friendlyName != null) 'friendlyName': friendlyName,
      if (photoUrls != null)
        'photoUrls': photoUrls?.toJson(valueToJson: (v) => v.toJson()),
      if (junctions != null)
        'junctions': junctions?.toJson(valueToJson: (v) => v.toJson()),
      if (favouritesJunctions != null)
        'favouritesJunctions':
            favouritesJunctions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'clubId': clubId,
      'type': type.toJson(),
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (model != null) 'model': model,
      if (friendlyName != null) 'friendlyName': friendlyName,
      if (photoUrls != null)
        'photoUrls': photoUrls?.toJson(valueToJson: (v) => v.toJson()),
      if (junctions != null)
        'junctions':
            junctions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (favouritesJunctions != null)
        'favouritesJunctions': favouritesJunctions?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static GearInclude include({
    _i3.RentalJunctionIncludeList? junctions,
    _i4.FavouritesJunctionIncludeList? favouritesJunctions,
  }) {
    return GearInclude._(
      junctions: junctions,
      favouritesJunctions: favouritesJunctions,
    );
  }

  static GearIncludeList includeList({
    _i1.WhereExpressionBuilder<GearTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearTable>? orderByList,
    GearInclude? include,
  }) {
    return GearIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Gear.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Gear.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearImpl extends Gear {
  _GearImpl({
    int? id,
    required String clubId,
    required _i2.GearType type,
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
    List<_i3.RentalJunction>? junctions,
    List<_i4.FavouritesJunction>? favouritesJunctions,
  }) : super._(
          id: id,
          clubId: clubId,
          type: type,
          manufacturer: manufacturer,
          model: model,
          friendlyName: friendlyName,
          photoUrls: photoUrls,
          junctions: junctions,
          favouritesJunctions: favouritesJunctions,
        );

  /// Returns a shallow copy of this [Gear]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Gear copyWith({
    Object? id = _Undefined,
    String? clubId,
    _i2.GearType? type,
    Object? manufacturer = _Undefined,
    Object? model = _Undefined,
    Object? friendlyName = _Undefined,
    Object? photoUrls = _Undefined,
    Object? junctions = _Undefined,
    Object? favouritesJunctions = _Undefined,
  }) {
    return Gear(
      id: id is int? ? id : this.id,
      clubId: clubId ?? this.clubId,
      type: type ?? this.type,
      manufacturer: manufacturer is String? ? manufacturer : this.manufacturer,
      model: model is String? ? model : this.model,
      friendlyName: friendlyName is String? ? friendlyName : this.friendlyName,
      photoUrls: photoUrls is List<Uri>?
          ? photoUrls
          : this.photoUrls?.map((e0) => e0).toList(),
      junctions: junctions is List<_i3.RentalJunction>?
          ? junctions
          : this.junctions?.map((e0) => e0.copyWith()).toList(),
      favouritesJunctions: favouritesJunctions is List<_i4.FavouritesJunction>?
          ? favouritesJunctions
          : this.favouritesJunctions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class GearTable extends _i1.Table<int?> {
  GearTable({super.tableRelation}) : super(tableName: 'gear') {
    clubId = _i1.ColumnString(
      'clubId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    manufacturer = _i1.ColumnString(
      'manufacturer',
      this,
    );
    model = _i1.ColumnString(
      'model',
      this,
    );
    friendlyName = _i1.ColumnString(
      'friendlyName',
      this,
    );
    photoUrls = _i1.ColumnSerializable(
      'photoUrls',
      this,
    );
  }

  late final _i1.ColumnString clubId;

  late final _i1.ColumnEnum<_i2.GearType> type;

  late final _i1.ColumnString manufacturer;

  late final _i1.ColumnString model;

  late final _i1.ColumnString friendlyName;

  late final _i1.ColumnSerializable photoUrls;

  _i3.RentalJunctionTable? ___junctions;

  _i1.ManyRelation<_i3.RentalJunctionTable>? _junctions;

  _i4.FavouritesJunctionTable? ___favouritesJunctions;

  _i1.ManyRelation<_i4.FavouritesJunctionTable>? _favouritesJunctions;

  _i3.RentalJunctionTable get __junctions {
    if (___junctions != null) return ___junctions!;
    ___junctions = _i1.createRelationTable(
      relationFieldName: '__junctions',
      field: Gear.t.id,
      foreignField: _i3.RentalJunction.t.gearId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.RentalJunctionTable(tableRelation: foreignTableRelation),
    );
    return ___junctions!;
  }

  _i4.FavouritesJunctionTable get __favouritesJunctions {
    if (___favouritesJunctions != null) return ___favouritesJunctions!;
    ___favouritesJunctions = _i1.createRelationTable(
      relationFieldName: '__favouritesJunctions',
      field: Gear.t.id,
      foreignField: _i4.FavouritesJunction.t.gearId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.FavouritesJunctionTable(tableRelation: foreignTableRelation),
    );
    return ___favouritesJunctions!;
  }

  _i1.ManyRelation<_i3.RentalJunctionTable> get junctions {
    if (_junctions != null) return _junctions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'junctions',
      field: Gear.t.id,
      foreignField: _i3.RentalJunction.t.gearId,
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

  _i1.ManyRelation<_i4.FavouritesJunctionTable> get favouritesJunctions {
    if (_favouritesJunctions != null) return _favouritesJunctions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'favouritesJunctions',
      field: Gear.t.id,
      foreignField: _i4.FavouritesJunction.t.gearId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.FavouritesJunctionTable(tableRelation: foreignTableRelation),
    );
    _favouritesJunctions = _i1.ManyRelation<_i4.FavouritesJunctionTable>(
      tableWithRelations: relationTable,
      table: _i4.FavouritesJunctionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _favouritesJunctions!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        clubId,
        type,
        manufacturer,
        model,
        friendlyName,
        photoUrls,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'junctions') {
      return __junctions;
    }
    if (relationField == 'favouritesJunctions') {
      return __favouritesJunctions;
    }
    return null;
  }
}

class GearInclude extends _i1.IncludeObject {
  GearInclude._({
    _i3.RentalJunctionIncludeList? junctions,
    _i4.FavouritesJunctionIncludeList? favouritesJunctions,
  }) {
    _junctions = junctions;
    _favouritesJunctions = favouritesJunctions;
  }

  _i3.RentalJunctionIncludeList? _junctions;

  _i4.FavouritesJunctionIncludeList? _favouritesJunctions;

  @override
  Map<String, _i1.Include?> get includes => {
        'junctions': _junctions,
        'favouritesJunctions': _favouritesJunctions,
      };

  @override
  _i1.Table<int?> get table => Gear.t;
}

class GearIncludeList extends _i1.IncludeList {
  GearIncludeList._({
    _i1.WhereExpressionBuilder<GearTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Gear.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Gear.t;
}

class GearRepository {
  const GearRepository._();

  final attach = const GearAttachRepository._();

  final attachRow = const GearAttachRowRepository._();

  final detach = const GearDetachRepository._();

  final detachRow = const GearDetachRowRepository._();

  /// Returns a list of [Gear]s matching the given query parameters.
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
  Future<List<Gear>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GearTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearTable>? orderByList,
    _i1.Transaction? transaction,
    GearInclude? include,
  }) async {
    return session.db.find<Gear>(
      where: where?.call(Gear.t),
      orderBy: orderBy?.call(Gear.t),
      orderByList: orderByList?.call(Gear.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Gear] matching the given query parameters.
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
  Future<Gear?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearTable>? where,
    int? offset,
    _i1.OrderByBuilder<GearTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GearTable>? orderByList,
    _i1.Transaction? transaction,
    GearInclude? include,
  }) async {
    return session.db.findFirstRow<Gear>(
      where: where?.call(Gear.t),
      orderBy: orderBy?.call(Gear.t),
      orderByList: orderByList?.call(Gear.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Gear] by its [id] or null if no such row exists.
  Future<Gear?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GearInclude? include,
  }) async {
    return session.db.findById<Gear>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Gear]s in the list and returns the inserted rows.
  ///
  /// The returned [Gear]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Gear>> insert(
    _i1.Session session,
    List<Gear> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Gear>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Gear] and returns the inserted row.
  ///
  /// The returned [Gear] will have its `id` field set.
  Future<Gear> insertRow(
    _i1.Session session,
    Gear row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Gear>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Gear]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Gear>> update(
    _i1.Session session,
    List<Gear> rows, {
    _i1.ColumnSelections<GearTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Gear>(
      rows,
      columns: columns?.call(Gear.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Gear]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Gear> updateRow(
    _i1.Session session,
    Gear row, {
    _i1.ColumnSelections<GearTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Gear>(
      row,
      columns: columns?.call(Gear.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Gear]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Gear>> delete(
    _i1.Session session,
    List<Gear> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Gear>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Gear].
  Future<Gear> deleteRow(
    _i1.Session session,
    Gear row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Gear>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Gear>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GearTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Gear>(
      where: where(Gear.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GearTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Gear>(
      where: where?.call(Gear.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GearAttachRepository {
  const GearAttachRepository._();

  /// Creates a relation between this [Gear] and the given [RentalJunction]s
  /// by setting each [RentalJunction]'s foreign key `gearId` to refer to this [Gear].
  Future<void> junctions(
    _i1.Session session,
    Gear gear,
    List<_i3.RentalJunction> rentalJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (rentalJunction.any((e) => e.id == null)) {
      throw ArgumentError.notNull('rentalJunction.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $rentalJunction =
        rentalJunction.map((e) => e.copyWith(gearId: gear.id)).toList();
    await session.db.update<_i3.RentalJunction>(
      $rentalJunction,
      columns: [_i3.RentalJunction.t.gearId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Gear] and the given [FavouritesJunction]s
  /// by setting each [FavouritesJunction]'s foreign key `gearId` to refer to this [Gear].
  Future<void> favouritesJunctions(
    _i1.Session session,
    Gear gear,
    List<_i4.FavouritesJunction> favouritesJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.any((e) => e.id == null)) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $favouritesJunction =
        favouritesJunction.map((e) => e.copyWith(gearId: gear.id)).toList();
    await session.db.update<_i4.FavouritesJunction>(
      $favouritesJunction,
      columns: [_i4.FavouritesJunction.t.gearId],
      transaction: transaction,
    );
  }
}

class GearAttachRowRepository {
  const GearAttachRowRepository._();

  /// Creates a relation between this [Gear] and the given [RentalJunction]
  /// by setting the [RentalJunction]'s foreign key `gearId` to refer to this [Gear].
  Future<void> junctions(
    _i1.Session session,
    Gear gear,
    _i3.RentalJunction rentalJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (rentalJunction.id == null) {
      throw ArgumentError.notNull('rentalJunction.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $rentalJunction = rentalJunction.copyWith(gearId: gear.id);
    await session.db.updateRow<_i3.RentalJunction>(
      $rentalJunction,
      columns: [_i3.RentalJunction.t.gearId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Gear] and the given [FavouritesJunction]
  /// by setting the [FavouritesJunction]'s foreign key `gearId` to refer to this [Gear].
  Future<void> favouritesJunctions(
    _i1.Session session,
    Gear gear,
    _i4.FavouritesJunction favouritesJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.id == null) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $favouritesJunction = favouritesJunction.copyWith(gearId: gear.id);
    await session.db.updateRow<_i4.FavouritesJunction>(
      $favouritesJunction,
      columns: [_i4.FavouritesJunction.t.gearId],
      transaction: transaction,
    );
  }
}

class GearDetachRepository {
  const GearDetachRepository._();

  /// Detaches the relation between this [Gear] and the given [RentalJunction]
  /// by setting the [RentalJunction]'s foreign key `gearId` to `null`.
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
        rentalJunction.map((e) => e.copyWith(gearId: null)).toList();
    await session.db.update<_i3.RentalJunction>(
      $rentalJunction,
      columns: [_i3.RentalJunction.t.gearId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Gear] and the given [FavouritesJunction]
  /// by setting the [FavouritesJunction]'s foreign key `gearId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> favouritesJunctions(
    _i1.Session session,
    List<_i4.FavouritesJunction> favouritesJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.any((e) => e.id == null)) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }

    var $favouritesJunction =
        favouritesJunction.map((e) => e.copyWith(gearId: null)).toList();
    await session.db.update<_i4.FavouritesJunction>(
      $favouritesJunction,
      columns: [_i4.FavouritesJunction.t.gearId],
      transaction: transaction,
    );
  }
}

class GearDetachRowRepository {
  const GearDetachRowRepository._();

  /// Detaches the relation between this [Gear] and the given [RentalJunction]
  /// by setting the [RentalJunction]'s foreign key `gearId` to `null`.
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

    var $rentalJunction = rentalJunction.copyWith(gearId: null);
    await session.db.updateRow<_i3.RentalJunction>(
      $rentalJunction,
      columns: [_i3.RentalJunction.t.gearId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Gear] and the given [FavouritesJunction]
  /// by setting the [FavouritesJunction]'s foreign key `gearId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> favouritesJunctions(
    _i1.Session session,
    _i4.FavouritesJunction favouritesJunction, {
    _i1.Transaction? transaction,
  }) async {
    if (favouritesJunction.id == null) {
      throw ArgumentError.notNull('favouritesJunction.id');
    }

    var $favouritesJunction = favouritesJunction.copyWith(gearId: null);
    await session.db.updateRow<_i4.FavouritesJunction>(
      $favouritesJunction,
      columns: [_i4.FavouritesJunction.t.gearId],
      transaction: transaction,
    );
  }
}
