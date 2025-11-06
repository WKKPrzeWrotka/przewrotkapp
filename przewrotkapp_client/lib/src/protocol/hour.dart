/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'hour_category.dart' as _i3;

abstract class Hour implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserInfo? user;

  int amount;

  String description;

  _i3.HourCategory category;

  DateTime date;

  bool approved;

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
