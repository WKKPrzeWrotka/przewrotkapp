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

abstract class GearFloatbag implements _i1.SerializableModel {
  GearFloatbag._({
    this.id,
    required this.gearId,
    this.gear,
    this.volume,
  });

  factory GearFloatbag({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    int? volume,
  }) = _GearFloatbagImpl;

  factory GearFloatbag.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearFloatbag(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      volume: jsonSerialization['volume'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i2.Gear? gear;

  int? volume;

  /// Returns a shallow copy of this [GearFloatbag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearFloatbag copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? volume,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      if (volume != null) 'volume': volume,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearFloatbagImpl extends GearFloatbag {
  _GearFloatbagImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    int? volume,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          volume: volume,
        );

  /// Returns a shallow copy of this [GearFloatbag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearFloatbag copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    Object? volume = _Undefined,
  }) {
    return GearFloatbag(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      volume: volume is int? ? volume : this.volume,
    );
  }
}
