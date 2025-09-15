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
import '../gear/gear.dart' as _i2;
import '../user/extra_user_info.dart' as _i3;

abstract class FavouritesJunction implements _i1.SerializableModel {
  FavouritesJunction._({
    this.id,
    required this.gearId,
    this.gear,
    required this.extraUserInfoId,
    this.extraUserInfo,
  });

  factory FavouritesJunction({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int extraUserInfoId,
    _i3.ExtraUserInfo? extraUserInfo,
  }) = _FavouritesJunctionImpl;

  factory FavouritesJunction.fromJson(Map<String, dynamic> jsonSerialization) {
    return FavouritesJunction(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      extraUserInfoId: jsonSerialization['extraUserInfoId'] as int,
      extraUserInfo: jsonSerialization['extraUserInfo'] == null
          ? null
          : _i3.ExtraUserInfo.fromJson(
              (jsonSerialization['extraUserInfo'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i2.Gear? gear;

  int extraUserInfoId;

  _i3.ExtraUserInfo? extraUserInfo;

  /// Returns a shallow copy of this [FavouritesJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FavouritesJunction copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? extraUserInfoId,
    _i3.ExtraUserInfo? extraUserInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'extraUserInfoId': extraUserInfoId,
      if (extraUserInfo != null) 'extraUserInfo': extraUserInfo?.toJson(),
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
    required int gearId,
    _i2.Gear? gear,
    required int extraUserInfoId,
    _i3.ExtraUserInfo? extraUserInfo,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          extraUserInfoId: extraUserInfoId,
          extraUserInfo: extraUserInfo,
        );

  /// Returns a shallow copy of this [FavouritesJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FavouritesJunction copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    int? extraUserInfoId,
    Object? extraUserInfo = _Undefined,
  }) {
    return FavouritesJunction(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      extraUserInfoId: extraUserInfoId ?? this.extraUserInfoId,
      extraUserInfo: extraUserInfo is _i3.ExtraUserInfo?
          ? extraUserInfo
          : this.extraUserInfo?.copyWith(),
    );
  }
}
