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
import '../gear/gear_type.dart' as _i2;
import '../rental/rental_junction.dart' as _i3;
import '../user/favourites.dart' as _i4;
import '../gear/comment.dart' as _i5;

abstract class Gear implements _i1.SerializableModel {
  Gear._({
    this.id,
    required this.clubId,
    required this.type,
    this.manufacturer,
    this.model,
    this.friendlyName,
    this.photoUrls,
    this.junctions,
    this.favouritesJunctions,
    this.comments,
  });

  factory Gear({
    int? id,
    required String clubId,
    required _i2.GearType type,
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
    List<_i3.RentalJunction>? junctions,
    List<_i4.FavouritesJunction>? favouritesJunctions,
    List<_i5.Comment>? comments,
  }) = _GearImpl;

  factory Gear.fromJson(Map<String, dynamic> jsonSerialization) {
    return Gear(
      id: jsonSerialization['id'] as int?,
      clubId: jsonSerialization['clubId'] as String,
      type: _i2.GearType.fromJson((jsonSerialization['type'] as String)),
      manufacturer: jsonSerialization['manufacturer'] as String?,
      model: jsonSerialization['model'] as String?,
      friendlyName: jsonSerialization['friendlyName'] as String?,
      photoUrls: (jsonSerialization['photoUrls'] as List?)
          ?.map((e) => _i1.UriJsonExtension.fromJson(e))
          .toList(),
      junctions: (jsonSerialization['junctions'] as List?)
          ?.map((e) => _i3.RentalJunction.fromJson((e as Map<String, dynamic>)))
          .toList(),
      favouritesJunctions: (jsonSerialization['favouritesJunctions'] as List?)
          ?.map((e) =>
              _i4.FavouritesJunction.fromJson((e as Map<String, dynamic>)))
          .toList(),
      comments: (jsonSerialization['comments'] as List?)
          ?.map((e) => _i5.Comment.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String clubId;

  _i2.GearType type;

  String? manufacturer;

  String? model;

  String? friendlyName;

  List<Uri>? photoUrls;

  List<_i3.RentalJunction>? junctions;

  List<_i4.FavouritesJunction>? favouritesJunctions;

  List<_i5.Comment>? comments;

  /// Returns a shallow copy of this [Gear]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Gear copyWith({
    int? id,
    String? clubId,
    _i2.GearType? type,
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
    List<_i3.RentalJunction>? junctions,
    List<_i4.FavouritesJunction>? favouritesJunctions,
    List<_i5.Comment>? comments,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'clubId': clubId,
      'type': type.toJson(),
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (model != null) 'model': model,
      if (friendlyName != null) 'friendlyName': friendlyName,
      if (photoUrls != null)
        'photoUrls': photoUrls?.toJson(valueToJson: (v) => v.toJson()),
      if (junctions != null)
        'junctions': junctions?.toJson(valueToJson: (v) => v.toJson()),
      if (favouritesJunctions != null)
        'favouritesJunctions':
            favouritesJunctions?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearImpl extends Gear {
  _GearImpl({
    int? id,
    required String clubId,
    required _i2.GearType type,
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
    List<_i3.RentalJunction>? junctions,
    List<_i4.FavouritesJunction>? favouritesJunctions,
    List<_i5.Comment>? comments,
  }) : super._(
          id: id,
          clubId: clubId,
          type: type,
          manufacturer: manufacturer,
          model: model,
          friendlyName: friendlyName,
          photoUrls: photoUrls,
          junctions: junctions,
          favouritesJunctions: favouritesJunctions,
          comments: comments,
        );

  /// Returns a shallow copy of this [Gear]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Gear copyWith({
    Object? id = _Undefined,
    String? clubId,
    _i2.GearType? type,
    Object? manufacturer = _Undefined,
    Object? model = _Undefined,
    Object? friendlyName = _Undefined,
    Object? photoUrls = _Undefined,
    Object? junctions = _Undefined,
    Object? favouritesJunctions = _Undefined,
    Object? comments = _Undefined,
  }) {
    return Gear(
      id: id is int? ? id : this.id,
      clubId: clubId ?? this.clubId,
      type: type ?? this.type,
      manufacturer: manufacturer is String? ? manufacturer : this.manufacturer,
      model: model is String? ? model : this.model,
      friendlyName: friendlyName is String? ? friendlyName : this.friendlyName,
      photoUrls: photoUrls is List<Uri>?
          ? photoUrls
          : this.photoUrls?.map((e0) => e0).toList(),
      junctions: junctions is List<_i3.RentalJunction>?
          ? junctions
          : this.junctions?.map((e0) => e0.copyWith()).toList(),
      favouritesJunctions: favouritesJunctions is List<_i4.FavouritesJunction>?
          ? favouritesJunctions
          : this.favouritesJunctions?.map((e0) => e0.copyWith()).toList(),
      comments: comments is List<_i5.Comment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
