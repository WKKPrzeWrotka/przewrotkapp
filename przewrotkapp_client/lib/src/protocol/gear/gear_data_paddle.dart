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
import '../gear/paddle_type.dart' as _i3;

abstract class GearDataPaddle implements _i1.SerializableModel {
  GearDataPaddle._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    required this.length,
    required this.rotation,
  });

  factory GearDataPaddle({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.PaddleType type,
    required double length,
    required int rotation,
  }) = _GearDataPaddleImpl;

  factory GearDataPaddle.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataPaddle(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      type: _i3.PaddleType.fromJson((jsonSerialization['type'] as String)),
      length: (jsonSerialization['length'] as num).toDouble(),
      rotation: jsonSerialization['rotation'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.PaddleType type;

  double length;

  /// Negative values represents variable - "up to abs(rotation)"
  int rotation;

  /// Returns a shallow copy of this [GearDataPaddle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataPaddle copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.PaddleType? type,
    double? length,
    int? rotation,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'type': type.toJson(),
      'length': length,
      'rotation': rotation,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataPaddleImpl extends GearDataPaddle {
  _GearDataPaddleImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.PaddleType type,
    required double length,
    required int rotation,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          type: type,
          length: length,
          rotation: rotation,
        );

  /// Returns a shallow copy of this [GearDataPaddle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataPaddle copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.PaddleType? type,
    double? length,
    int? rotation,
  }) {
    return GearDataPaddle(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      length: length ?? this.length,
      rotation: rotation ?? this.rotation,
    );
  }
}
