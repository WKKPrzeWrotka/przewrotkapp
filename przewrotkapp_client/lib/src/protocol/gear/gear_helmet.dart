/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import '../protocol.dart' as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import '../gear/gear.dart' as _i3;
import '../gear/generic_gear_size.dart' as _i4;

abstract class GearHelmet extends _i1.GearExtra
    implements _i2.SerializableModel {
  GearHelmet._({
    this.id,
    required this.gearId,
    this.gear,
    required this.size,
  });

  factory GearHelmet({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required _i4.GenericGearSize size,
  }) = _GearHelmetImpl;

  factory GearHelmet.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearHelmet(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i3.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      size: _i4.GenericGearSize.fromJson((jsonSerialization['size'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i3.Gear? gear;

  _i4.GenericGearSize size;

  /// Returns a shallow copy of this [GearHelmet]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  GearHelmet copyWith({
    int? id,
    int? gearId,
    _i3.Gear? gear,
    _i4.GenericGearSize? size,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'size': size.toJson(),
    };
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearHelmetImpl extends GearHelmet {
  _GearHelmetImpl({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required _i4.GenericGearSize size,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          size: size,
        );

  /// Returns a shallow copy of this [GearHelmet]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  GearHelmet copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i4.GenericGearSize? size,
  }) {
    return GearHelmet(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i3.Gear? ? gear : this.gear?.copyWith(),
      size: size ?? this.size,
    );
  }
}
