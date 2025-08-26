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
import '../gear/kayak_type.dart' as _i3;

abstract class GearDataKayak implements _i1.SerializableModel {
  GearDataKayak._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    required this.minWeight,
    required this.maxWeight,
    required this.length,
  });

  factory GearDataKayak({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.KayakType type,
    required int minWeight,
    required int maxWeight,
    required int length,
  }) = _GearDataKayakImpl;

  factory GearDataKayak.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearDataKayak(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      type: _i3.KayakType.fromJson((jsonSerialization['type'] as String)),
      minWeight: jsonSerialization['minWeight'] as int,
      maxWeight: jsonSerialization['maxWeight'] as int,
      length: jsonSerialization['length'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i2.Gear? gear;

  _i3.KayakType type;

  int minWeight;

  int maxWeight;

  int length;

  /// Returns a shallow copy of this [GearDataKayak]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearDataKayak copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    _i3.KayakType? type,
    int? minWeight,
    int? maxWeight,
    int? length,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'type': type.toJson(),
      'minWeight': minWeight,
      'maxWeight': maxWeight,
      'length': length,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearDataKayakImpl extends GearDataKayak {
  _GearDataKayakImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required _i3.KayakType type,
    required int minWeight,
    required int maxWeight,
    required int length,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          type: type,
          minWeight: minWeight,
          maxWeight: maxWeight,
          length: length,
        );

  /// Returns a shallow copy of this [GearDataKayak]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearDataKayak copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i3.KayakType? type,
    int? minWeight,
    int? maxWeight,
    int? length,
  }) {
    return GearDataKayak(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      minWeight: minWeight ?? this.minWeight,
      maxWeight: maxWeight ?? this.maxWeight,
      length: length ?? this.length,
    );
  }
}
