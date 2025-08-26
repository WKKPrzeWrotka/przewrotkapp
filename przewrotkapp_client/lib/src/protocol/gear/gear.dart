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

abstract class Gear implements _i1.SerializableModel {
  Gear._({
    this.id,
    required this.clubId,
    this.manufacturer,
    this.model,
    this.friendlyName,
    this.photoUrls,
  });

  factory Gear({
    int? id,
    required String clubId,
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
  }) = _GearImpl;

  factory Gear.fromJson(Map<String, dynamic> jsonSerialization) {
    return Gear(
      id: jsonSerialization['id'] as int?,
      clubId: jsonSerialization['clubId'] as String,
      manufacturer: jsonSerialization['manufacturer'] as String?,
      model: jsonSerialization['model'] as String?,
      friendlyName: jsonSerialization['friendlyName'] as String?,
      photoUrls: (jsonSerialization['photoUrls'] as List?)
          ?.map((e) => _i1.UriJsonExtension.fromJson(e))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String clubId;

  String? manufacturer;

  String? model;

  String? friendlyName;

  List<Uri>? photoUrls;

  /// Returns a shallow copy of this [Gear]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Gear copyWith({
    int? id,
    String? clubId,
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'clubId': clubId,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (model != null) 'model': model,
      if (friendlyName != null) 'friendlyName': friendlyName,
      if (photoUrls != null)
        'photoUrls': photoUrls?.toJson(valueToJson: (v) => v.toJson()),
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
    String? manufacturer,
    String? model,
    String? friendlyName,
    List<Uri>? photoUrls,
  }) : super._(
          id: id,
          clubId: clubId,
          manufacturer: manufacturer,
          model: model,
          friendlyName: friendlyName,
          photoUrls: photoUrls,
        );

  /// Returns a shallow copy of this [Gear]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Gear copyWith({
    Object? id = _Undefined,
    String? clubId,
    Object? manufacturer = _Undefined,
    Object? model = _Undefined,
    Object? friendlyName = _Undefined,
    Object? photoUrls = _Undefined,
  }) {
    return Gear(
      id: id is int? ? id : this.id,
      clubId: clubId ?? this.clubId,
      manufacturer: manufacturer is String? ? manufacturer : this.manufacturer,
      model: model is String? ? model : this.model,
      friendlyName: friendlyName is String? ? friendlyName : this.friendlyName,
      photoUrls: photoUrls is List<Uri>?
          ? photoUrls
          : this.photoUrls?.map((e0) => e0).toList(),
    );
  }
}
