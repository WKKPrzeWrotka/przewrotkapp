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
import '../gear/clothing_type.dart' as _i5;

abstract class GearClothing extends _i1.GearExtra
    implements _i2.SerializableModel {
  GearClothing._({
    this.id,
    required this.gearId,
    this.gear,
    required this.size,
    required this.type,
    this.typeDescription,
  });

  factory GearClothing({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required _i4.GenericGearSize size,
    required _i5.ClothingType type,
    String? typeDescription,
  }) = _GearClothingImpl;

  factory GearClothing.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearClothing(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i3.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      size: _i4.GenericGearSize.fromJson((jsonSerialization['size'] as String)),
      type: _i5.ClothingType.fromJson((jsonSerialization['type'] as String)),
      typeDescription: jsonSerialization['typeDescription'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i3.Gear? gear;

  _i4.GenericGearSize size;

  _i5.ClothingType type;

  String? typeDescription;

  /// Returns a shallow copy of this [GearClothing]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  GearClothing copyWith({
    int? id,
    int? gearId,
    _i3.Gear? gear,
    _i4.GenericGearSize? size,
    _i5.ClothingType? type,
    String? typeDescription,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'size': size.toJson(),
      'type': type.toJson(),
      if (typeDescription != null) 'typeDescription': typeDescription,
    };
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearClothingImpl extends GearClothing {
  _GearClothingImpl({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required _i4.GenericGearSize size,
    required _i5.ClothingType type,
    String? typeDescription,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          size: size,
          type: type,
          typeDescription: typeDescription,
        );

  /// Returns a shallow copy of this [GearClothing]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  GearClothing copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i4.GenericGearSize? size,
    _i5.ClothingType? type,
    Object? typeDescription = _Undefined,
  }) {
    return GearClothing(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i3.Gear? ? gear : this.gear?.copyWith(),
      size: size ?? this.size,
      type: type ?? this.type,
      typeDescription:
          typeDescription is String? ? typeDescription : this.typeDescription,
    );
  }
}
