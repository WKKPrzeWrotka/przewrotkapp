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
import '../rental/rental.dart' as _i3;

abstract class RentalJunction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RentalJunction._({
    this.id,
    required this.gearId,
    this.gear,
    required this.rentalId,
    this.rental,
  });

  factory RentalJunction({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int rentalId,
    _i3.Rental? rental,
  }) = _RentalJunctionImpl;

  factory RentalJunction.fromJson(Map<String, dynamic> jsonSerialization) {
    return RentalJunction(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      rentalId: jsonSerialization['rentalId'] as int,
      rental: jsonSerialization['rental'] == null
          ? null
          : _i3.Rental.fromJson(
              (jsonSerialization['rental'] as Map<String, dynamic>)),
    );
  }

  static final t = RentalJunctionTable();

  static const db = RentalJunctionRepository._();

  @override
  int? id;

  int gearId;

  _i2.Gear? gear;

  int rentalId;

  _i3.Rental? rental;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RentalJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RentalJunction copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? rentalId,
    _i3.Rental? rental,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'rentalId': rentalId,
      if (rental != null) 'rental': rental?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJsonForProtocol(),
      'rentalId': rentalId,
      if (rental != null) 'rental': rental?.toJsonForProtocol(),
    };
  }

  static RentalJunctionInclude include({
    _i2.GearInclude? gear,
    _i3.RentalInclude? rental,
  }) {
    return RentalJunctionInclude._(
      gear: gear,
      rental: rental,
    );
  }

  static RentalJunctionIncludeList includeList({
    _i1.WhereExpressionBuilder<RentalJunctionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RentalJunctionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RentalJunctionTable>? orderByList,
    RentalJunctionInclude? include,
  }) {
    return RentalJunctionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RentalJunction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RentalJunction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RentalJunctionImpl extends RentalJunction {
  _RentalJunctionImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int rentalId,
    _i3.Rental? rental,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          rentalId: rentalId,
          rental: rental,
        );

  /// Returns a shallow copy of this [RentalJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RentalJunction copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    int? rentalId,
    Object? rental = _Undefined,
  }) {
    return RentalJunction(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      rentalId: rentalId ?? this.rentalId,
      rental: rental is _i3.Rental? ? rental : this.rental?.copyWith(),
    );
  }
}

class RentalJunctionTable extends _i1.Table<int?> {
  RentalJunctionTable({super.tableRelation})
      : super(tableName: 'rental_junctions') {
    gearId = _i1.ColumnInt(
      'gearId',
      this,
    );
    rentalId = _i1.ColumnInt(
      'rentalId',
      this,
    );
  }

  late final _i1.ColumnInt gearId;

  _i2.GearTable? _gear;

  late final _i1.ColumnInt rentalId;

  _i3.RentalTable? _rental;

  _i2.GearTable get gear {
    if (_gear != null) return _gear!;
    _gear = _i1.createRelationTable(
      relationFieldName: 'gear',
      field: RentalJunction.t.gearId,
      foreignField: _i2.Gear.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GearTable(tableRelation: foreignTableRelation),
    );
    return _gear!;
  }

  _i3.RentalTable get rental {
    if (_rental != null) return _rental!;
    _rental = _i1.createRelationTable(
      relationFieldName: 'rental',
      field: RentalJunction.t.rentalId,
      foreignField: _i3.Rental.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.RentalTable(tableRelation: foreignTableRelation),
    );
    return _rental!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        gearId,
        rentalId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gear') {
      return gear;
    }
    if (relationField == 'rental') {
      return rental;
    }
    return null;
  }
}

class RentalJunctionInclude extends _i1.IncludeObject {
  RentalJunctionInclude._({
    _i2.GearInclude? gear,
    _i3.RentalInclude? rental,
  }) {
    _gear = gear;
    _rental = rental;
  }

  _i2.GearInclude? _gear;

  _i3.RentalInclude? _rental;

  @override
  Map<String, _i1.Include?> get includes => {
        'gear': _gear,
        'rental': _rental,
      };

  @override
  _i1.Table<int?> get table => RentalJunction.t;
}

class RentalJunctionIncludeList extends _i1.IncludeList {
  RentalJunctionIncludeList._({
    _i1.WhereExpressionBuilder<RentalJunctionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RentalJunction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RentalJunction.t;
}

class RentalJunctionRepository {
  const RentalJunctionRepository._();

  final attachRow = const RentalJunctionAttachRowRepository._();

  /// Returns a list of [RentalJunction]s matching the given query parameters.
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
  Future<List<RentalJunction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RentalJunctionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RentalJunctionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RentalJunctionTable>? orderByList,
    _i1.Transaction? transaction,
    RentalJunctionInclude? include,
  }) async {
    return session.db.find<RentalJunction>(
      where: where?.call(RentalJunction.t),
      orderBy: orderBy?.call(RentalJunction.t),
      orderByList: orderByList?.call(RentalJunction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [RentalJunction] matching the given query parameters.
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
  Future<RentalJunction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RentalJunctionTable>? where,
    int? offset,
    _i1.OrderByBuilder<RentalJunctionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RentalJunctionTable>? orderByList,
    _i1.Transaction? transaction,
    RentalJunctionInclude? include,
  }) async {
    return session.db.findFirstRow<RentalJunction>(
      where: where?.call(RentalJunction.t),
      orderBy: orderBy?.call(RentalJunction.t),
      orderByList: orderByList?.call(RentalJunction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [RentalJunction] by its [id] or null if no such row exists.
  Future<RentalJunction?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RentalJunctionInclude? include,
  }) async {
    return session.db.findById<RentalJunction>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [RentalJunction]s in the list and returns the inserted rows.
  ///
  /// The returned [RentalJunction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RentalJunction>> insert(
    _i1.Session session,
    List<RentalJunction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RentalJunction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RentalJunction] and returns the inserted row.
  ///
  /// The returned [RentalJunction] will have its `id` field set.
  Future<RentalJunction> insertRow(
    _i1.Session session,
    RentalJunction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RentalJunction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RentalJunction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RentalJunction>> update(
    _i1.Session session,
    List<RentalJunction> rows, {
    _i1.ColumnSelections<RentalJunctionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RentalJunction>(
      rows,
      columns: columns?.call(RentalJunction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RentalJunction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RentalJunction> updateRow(
    _i1.Session session,
    RentalJunction row, {
    _i1.ColumnSelections<RentalJunctionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RentalJunction>(
      row,
      columns: columns?.call(RentalJunction.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RentalJunction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RentalJunction>> delete(
    _i1.Session session,
    List<RentalJunction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RentalJunction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RentalJunction].
  Future<RentalJunction> deleteRow(
    _i1.Session session,
    RentalJunction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RentalJunction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RentalJunction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RentalJunctionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RentalJunction>(
      where: where(RentalJunction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RentalJunctionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RentalJunction>(
      where: where?.call(RentalJunction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RentalJunctionAttachRowRepository {
  const RentalJunctionAttachRowRepository._();

  /// Creates a relation between the given [RentalJunction] and [Gear]
  /// by setting the [RentalJunction]'s foreign key `gearId` to refer to the [Gear].
  Future<void> gear(
    _i1.Session session,
    RentalJunction rentalJunction,
    _i2.Gear gear, {
    _i1.Transaction? transaction,
  }) async {
    if (rentalJunction.id == null) {
      throw ArgumentError.notNull('rentalJunction.id');
    }
    if (gear.id == null) {
      throw ArgumentError.notNull('gear.id');
    }

    var $rentalJunction = rentalJunction.copyWith(gearId: gear.id);
    await session.db.updateRow<RentalJunction>(
      $rentalJunction,
      columns: [RentalJunction.t.gearId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [RentalJunction] and [Rental]
  /// by setting the [RentalJunction]'s foreign key `rentalId` to refer to the [Rental].
  Future<void> rental(
    _i1.Session session,
    RentalJunction rentalJunction,
    _i3.Rental rental, {
    _i1.Transaction? transaction,
  }) async {
    if (rentalJunction.id == null) {
      throw ArgumentError.notNull('rentalJunction.id');
    }
    if (rental.id == null) {
      throw ArgumentError.notNull('rental.id');
    }

    var $rentalJunction = rentalJunction.copyWith(rentalId: rental.id);
    await session.db.updateRow<RentalJunction>(
      $rentalJunction,
      columns: [RentalJunction.t.rentalId],
      transaction: transaction,
    );
  }
}
