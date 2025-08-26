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
import '../gear/generic_gear_size.dart' as _i3;

abstract class GearDataHelmet implements _i1.SerializableModel {
  GearDataHelmet._({
    this.id,
    required this.gearId,
    this.gear,
    required this.size,
  });

  factory GearDataHelmet({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
  }) = _GearDataHelmetImpl;

  factory GearDataHelmet.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataHelmet(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      size: _i3.GenericGearSize.fromJson((jsonSerialization['size'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.GenericGearSize size;

  /// Returns a shallow copy of this [GearDataHelmet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataHelmet copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.GenericGearSize? size,
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
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataHelmetImpl extends GearDataHelmet {
  _GearDataHelmetImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          size: size,
        );

  /// Returns a shallow copy of this [GearDataHelmet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataHelmet copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.GenericGearSize? size,
  }) {
    return GearDataHelmet(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      size: size ?? this.size,
    );
  }
}
