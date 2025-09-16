/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../gear/gear.dart' as _i2;
import '../gear/gear_extra.dart' as _i3;

abstract class GearPair
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GearPair._({
    required this.gear,
    required this.gearExtra,
  });

  factory GearPair({
    required _i2.Gear gear,
    required _i3.GearExtra gearExtra,
  }) = _GearPairImpl;

  factory GearPair.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearPair(
      gear: _i2.Gear.fromJson(
          (jsonSerialization['gear'] as Map<String, dynamic>)),
      gearExtra: _i3.GearExtra.fromJson(
          (jsonSerialization['gearExtra'] as Map<String, dynamic>)),
    );
  }

  _i2.Gear gear;

  _i3.GearExtra gearExtra;

  /// Returns a shallow copy of this [GearPair]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearPair copyWith({
    _i2.Gear? gear,
    _i3.GearExtra? gearExtra,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'gear': gear.toJson(),
      'gearExtra': gearExtra.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'gear': gear.toJsonForProtocol(),
      'gearExtra': gearExtra.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GearPairImpl extends GearPair {
  _GearPairImpl({
    required _i2.Gear gear,
    required _i3.GearExtra gearExtra,
  }) : super._(
          gear: gear,
          gearExtra: gearExtra,
        );

  /// Returns a shallow copy of this [GearPair]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearPair copyWith({
    _i2.Gear? gear,
    _i3.GearExtra? gearExtra,
  }) {
    return GearPair(
      gear: gear ?? this.gear.copyWith(),
      gearExtra: gearExtra ?? this.gearExtra.copyWith(),
    );
  }
}
