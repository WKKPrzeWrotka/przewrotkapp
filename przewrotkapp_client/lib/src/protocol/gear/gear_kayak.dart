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
import '../gear/kayak_type.dart' as _i4;

abstract class GearKayak extends _i1.GearExtra
    implements _i2.SerializableModel {
  GearKayak._({
    this.id,
    required this.gearId,
    this.gear,
    required this.type,
    this.minWeight,
    this.maxWeight,
    required this.length,
  });

  factory GearKayak({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required _i4.KayakType type,
    int? minWeight,
    int? maxWeight,
    required int length,
  }) = _GearKayakImpl;

  factory GearKayak.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearKayak(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i3.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      type: _i4.KayakType.fromJson((jsonSerialization['type'] as String)),
      minWeight: jsonSerialization['minWeight'] as int?,
      maxWeight: jsonSerialization['maxWeight'] as int?,
      length: jsonSerialization['length'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i3.Gear? gear;

  _i4.KayakType type;

  int? minWeight;

  int? maxWeight;

  int length;

  /// Returns a shallow copy of this [GearKayak]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  GearKayak copyWith({
    int? id,
    int? gearId,
    _i3.Gear? gear,
    _i4.KayakType? type,
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
      if (minWeight != null) 'minWeight': minWeight,
      if (maxWeight != null) 'maxWeight': maxWeight,
      'length': length,
    };
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearKayakImpl extends GearKayak {
  _GearKayakImpl({
    int? id,
    required int gearId,
    _i3.Gear? gear,
    required _i4.KayakType type,
    int? minWeight,
    int? maxWeight,
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

  /// Returns a shallow copy of this [GearKayak]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  GearKayak copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    _i4.KayakType? type,
    Object? minWeight = _Undefined,
    Object? maxWeight = _Undefined,
    int? length,
  }) {
    return GearKayak(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i3.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      minWeight: minWeight is int? ? minWeight : this.minWeight,
      maxWeight: maxWeight is int? ? maxWeight : this.maxWeight,
      length: length ?? this.length,
    );
  }
}
