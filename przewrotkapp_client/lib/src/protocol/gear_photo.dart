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
import 'gear/gear.dart' as _i2;

abstract class GearPhoto implements _i1.SerializableModel {
  GearPhoto._({
    this.id,
    this.gearId,
    this.gear,
    required this.width,
    required this.height,
    this.blurhash,
    required this.path,
  });

  factory GearPhoto({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    required int width,
    required int height,
    String? blurhash,
    required String path,
  }) = _GearPhotoImpl;

  factory GearPhoto.fromJson(Map<String, dynamic> jsonSerialization) {
    return GearPhoto(
      id: jsonSerialization['id'] as int?,
      gearId: jsonSerialization['gearId'] as int?,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i2.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      width: jsonSerialization['width'] as int,
      height: jsonSerialization['height'] as int,
      blurhash: jsonSerialization['blurhash'] as String?,
      path: jsonSerialization['path'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? gearId;

  _i2.Gear? gear;

  int width;

  int height;

  String? blurhash;

  String path;

  /// Returns a shallow copy of this [GearPhoto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GearPhoto copyWith({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    int? width,
    int? height,
    String? blurhash,
    String? path,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (gearId != null) 'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'width': width,
      'height': height,
      if (blurhash != null) 'blurhash': blurhash,
      'path': path,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GearPhotoImpl extends GearPhoto {
  _GearPhotoImpl({
    int? id,
    int? gearId,
    _i2.Gear? gear,
    required int width,
    required int height,
    String? blurhash,
    required String path,
  }) : super._(
          id: id,
          gearId: gearId,
          gear: gear,
          width: width,
          height: height,
          blurhash: blurhash,
          path: path,
        );

  /// Returns a shallow copy of this [GearPhoto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GearPhoto copyWith({
    Object? id = _Undefined,
    Object? gearId = _Undefined,
    Object? gear = _Undefined,
    int? width,
    int? height,
    Object? blurhash = _Undefined,
    String? path,
  }) {
    return GearPhoto(
      id: id is int? ? id : this.id,
      gearId: gearId is int? ? gearId : this.gearId,
      gear: gear is _i2.Gear? ? gear : this.gear?.copyWith(),
      width: width ?? this.width,
      height: height ?? this.height,
      blurhash: blurhash is String? ? blurhash : this.blurhash,
      path: path ?? this.path,
    );
  }
}
