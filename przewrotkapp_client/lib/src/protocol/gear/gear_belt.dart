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

abstract class GearBelt extends _i1.GearExtra implements _i2.SerializableModel {
  GearBelt._({
    this.id,
    required this.gearId,
    this.gear,
    required this.length,
  });

  factory GearBelt({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required double length,
  }) = _GearBeltImpl;

  factory GearBelt.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearBelt(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i3.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      length: (jsonSerialization['length'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i3.Gear? gear;

  double length;

  /// Returns a shallow copy of this [GearBelt]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  GearBelt copyWith({
    int? id,
    int? gearId,
    _i3.Gear? gear,
    double? length,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'length': length,
    };
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearBeltImpl extends GearBelt {
  _GearBeltImpl({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required double length,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          length: length,
        );

  /// Returns a shallow copy of this [GearBelt]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  GearBelt copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    double? length,
  }) {
    return GearBelt(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i3.Gear? ? gear : this.gear?.copyWith(),
      length: length ?? this.length,
    );
  }
}
