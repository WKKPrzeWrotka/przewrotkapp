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
import '../rental/rental.dart' as _i3;

abstract class RentalJunction implements _i1.SerializableModel {
  RentalJunction._({
    this.id,
    required this.gearId,
    this.gear,
    required this.rentalId,
    this.rental,
  });

  factory RentalJunction({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int rentalId,
    _i3.Rental? rental,
  }) = _RentalJunctionImpl;

  factory RentalJunction.fromJson(Map<String, dynamic> jsonSerialization) {
    return RentalJunction(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      rentalId: jsonSerialization['rentalId'] as int,
      rental: jsonSerialization['rental'] == null
          ? null
          : _i3.Rental.fromJson(
              (jsonSerialization['rental'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gearId;

  _i2.Gear? gear;

  int rentalId;

  _i3.Rental? rental;

  /// Returns a shallow copy of this [RentalJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RentalJunction copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? rentalId,
    _i3.Rental? rental,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'rentalId': rentalId,
      if (rental != null) 'rental': rental?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RentalJunctionImpl extends RentalJunction {
  _RentalJunctionImpl({
    int? id,
    required int gearId,
    _i2.Gear? gear,
    required int rentalId,
    _i3.Rental? rental,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          rentalId: rentalId,
          rental: rental,
        );

  /// Returns a shallow copy of this [RentalJunction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RentalJunction copyWith({
    Object? id = _Undefined,
    int? gearId,
    Object? gear = _Undefined,
    int? rentalId,
    Object? rental = _Undefined,
  }) {
    return RentalJunction(
      id: id is int? ? id : this.id,
      gearId: gearId ?? this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      rentalId: rentalId ?? this.rentalId,
      rental: rental is _i3.Rental? ? rental : this.rental?.copyWith(),
    );
  }
}
