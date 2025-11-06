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
import '../gear/gear.dart' as _i3;

abstract class FavouritesJunction implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserInfo? user;

  int gearId;

  _i3.Gear? gear;

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
