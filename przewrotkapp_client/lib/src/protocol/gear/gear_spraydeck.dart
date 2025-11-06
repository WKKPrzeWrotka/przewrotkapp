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
import '../gear/spraydeck_deck_size.dart' as _i4;
import '../gear/generic_gear_size.dart' as _i5;

abstract class GearSpraydeck extends _i1.GearExtra
    implements _i2.SerializableModel {
  GearSpraydeck._({
    this.id,
    required this.gearId,
    this.gear,
    required this.deckSize,
    required this.waistSize,
  });

  factory GearSpraydeck({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required _i4.SpraydeckDeckSize deckSize,
    required _i5.GenericGearSize waistSize,
  }) = _GearSpraydeckImpl;

  factory GearSpraydeck.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearSpraydeck(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i3.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      deckSize: _i4.SpraydeckDeckSize.fromJson(
          (jsonSerialization['deckSize'] as String)),
      waistSize: _i5.GenericGearSize.fromJson(
          (jsonSerialization['waistSize'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i3.Gear? gear;

  _i4.SpraydeckDeckSize deckSize;

  _i5.GenericGearSize waistSize;

  /// Returns a shallow copy of this [GearSpraydeck]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  GearSpraydeck copyWith({
    int? id,
    int? gearId,
    _i3.Gear? gear,
    _i4.SpraydeckDeckSize? deckSize,
    _i5.GenericGearSize? waistSize,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'deckSize': deckSize.toJson(),
      'waistSize': waistSize.toJson(),
    };
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearSpraydeckImpl extends GearSpraydeck {
  _GearSpraydeckImpl({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required _i4.SpraydeckDeckSize deckSize,
    required _i5.GenericGearSize waistSize,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          deckSize: deckSize,
          waistSize: waistSize,
        );

  /// Returns a shallow copy of this [GearSpraydeck]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  GearSpraydeck copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i4.SpraydeckDeckSize? deckSize,
    _i5.GenericGearSize? waistSize,
  }) {
    return GearSpraydeck(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i3.Gear? ? gear : this.gear?.copyWith(),
      deckSize: deckSize ?? this.deckSize,
      waistSize: waistSize ?? this.waistSize,
    );
  }
}
