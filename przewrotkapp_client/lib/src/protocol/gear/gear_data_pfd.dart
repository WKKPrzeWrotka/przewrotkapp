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
import '../gear/pfd_type.dart' as _i4;

abstract class GearDataPfd implements _i1.SerializableModel {
  GearDataPfd._({
    this.id,
    required this.gearId,
    this.gear,
    required this.size,
    required this.type,
  });

  factory GearDataPfd({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
    required _i4.PfdType type,
  }) = _GearDataPfdImpl;

  factory GearDataPfd.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataPfd(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      size: _i3.GenericGearSize.fromJson((jsonSerialization['size'] as String)),
      type: _i4.PfdType.fromJson((jsonSerialization['type'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.GenericGearSize size;

  _i4.PfdType type;

  /// Returns a shallow copy of this [GearDataPfd]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataPfd copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.GenericGearSize? size,
    _i4.PfdType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'size': size.toJson(),
      'type': type.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataPfdImpl extends GearDataPfd {
  _GearDataPfdImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.GenericGearSize size,
    required _i4.PfdType type,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          size: size,
          type: type,
        );

  /// Returns a shallow copy of this [GearDataPfd]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataPfd copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.GenericGearSize? size,
    _i4.PfdType? type,
  }) {
    return GearDataPfd(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      size: size ?? this.size,
      type: type ?? this.type,
    );
  }
}
