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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import '../gear/gear.dart' as _i3;
import '../gear/comment_type.dart' as _i4;

abstract class Comment implements _i1.SerializableModel {
  Comment._({
    this.id,
    required this.byId,
    this.by,
    DateTime? dateCreated,
    this.gearId,
    this.gear,
    required this.type,
    required this.text,
    this.hoursForResolving,
    bool? resolved,
    this.resolvedById,
    this.resolvedBy,
    this.dateResolved,
  })  : dateCreated = dateCreated ?? DateTime.parse('2025-08-30T12:00:00.000Z'),
        resolved = resolved ?? false;

  factory Comment({
    int? id,
    required int byId,
    _i2.UserInfo? by,
    DateTime? dateCreated,
    int? gearId,
    _i3.Gear? gear,
    required _i4.CommentType type,
    required String text,
    int? hoursForResolving,
    bool? resolved,
    int? resolvedById,
    _i2.UserInfo? resolvedBy,
    DateTime? dateResolved,
  }) = _CommentImpl;

  factory Comment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Comment(
      id: jsonSerialization['id'] as int?,
      byId: jsonSerialization['byId'] as int,
      by: jsonSerialization['by'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['by'] as Map<String, dynamic>)),
      dateCreated:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateCreated']),
      gearId: jsonSerialization['gearId'] as int?,
      gear: jsonSerialization['gear'] == null
          ? null
          : _i3.Gear.fromJson(
              (jsonSerialization['gear'] as Map<String, dynamic>)),
      type: _i4.CommentType.fromJson((jsonSerialization['type'] as String)),
      text: jsonSerialization['text'] as String,
      hoursForResolving: jsonSerialization['hoursForResolving'] as int?,
      resolved: jsonSerialization['resolved'] as bool,
      resolvedById: jsonSerialization['resolvedById'] as int?,
      resolvedBy: jsonSerialization['resolvedBy'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['resolvedBy'] as Map<String, dynamic>)),
      dateResolved: jsonSerialization['dateResolved'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateResolved']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int byId;

  _i2.UserInfo? by;

  DateTime dateCreated;

  int? gearId;

  _i3.Gear? gear;

  _i4.CommentType type;

  String text;

  int? hoursForResolving;

  bool resolved;

  int? resolvedById;

  _i2.UserInfo? resolvedBy;

  DateTime? dateResolved;

  /// Returns a shallow copy of this [Comment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Comment copyWith({
    int? id,
    int? byId,
    _i2.UserInfo? by,
    DateTime? dateCreated,
    int? gearId,
    _i3.Gear? gear,
    _i4.CommentType? type,
    String? text,
    int? hoursForResolving,
    bool? resolved,
    int? resolvedById,
    _i2.UserInfo? resolvedBy,
    DateTime? dateResolved,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'byId': byId,
      if (by != null) 'by': by?.toJson(),
      'dateCreated': dateCreated.toJson(),
      if (gearId != null) 'gearId': gearId,
      if (gear != null) 'gear': gear?.toJson(),
      'type': type.toJson(),
      'text': text,
      if (hoursForResolving != null) 'hoursForResolving': hoursForResolving,
      'resolved': resolved,
      if (resolvedById != null) 'resolvedById': resolvedById,
      if (resolvedBy != null) 'resolvedBy': resolvedBy?.toJson(),
      if (dateResolved != null) 'dateResolved': dateResolved?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommentImpl extends Comment {
  _CommentImpl({
    int? id,
    required int byId,
    _i2.UserInfo? by,
    DateTime? dateCreated,
    int? gearId,
    _i3.Gear? gear,
    required _i4.CommentType type,
    required String text,
    int? hoursForResolving,
    bool? resolved,
    int? resolvedById,
    _i2.UserInfo? resolvedBy,
    DateTime? dateResolved,
  }) : super._(
          id: id,
          byId: byId,
          by: by,
          dateCreated: dateCreated,
          gearId: gearId,
          gear: gear,
          type: type,
          text: text,
          hoursForResolving: hoursForResolving,
          resolved: resolved,
          resolvedById: resolvedById,
          resolvedBy: resolvedBy,
          dateResolved: dateResolved,
        );

  /// Returns a shallow copy of this [Comment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Comment copyWith({
    Object? id = _Undefined,
    int? byId,
    Object? by = _Undefined,
    DateTime? dateCreated,
    Object? gearId = _Undefined,
    Object? gear = _Undefined,
    _i4.CommentType? type,
    String? text,
    Object? hoursForResolving = _Undefined,
    bool? resolved,
    Object? resolvedById = _Undefined,
    Object? resolvedBy = _Undefined,
    Object? dateResolved = _Undefined,
  }) {
    return Comment(
      id: id is int? ? id : this.id,
      byId: byId ?? this.byId,
      by: by is _i2.UserInfo? ? by : this.by?.copyWith(),
      dateCreated: dateCreated ?? this.dateCreated,
      gearId: gearId is int? ? gearId : this.gearId,
      gear: gear is _i3.Gear? ? gear : this.gear?.copyWith(),
      type: type ?? this.type,
      text: text ?? this.text,
      hoursForResolving: hoursForResolving is int?
          ? hoursForResolving
          : this.hoursForResolving,
      resolved: resolved ?? this.resolved,
      resolvedById: resolvedById is int? ? resolvedById : this.resolvedById,
      resolvedBy: resolvedBy is _i2.UserInfo?
          ? resolvedBy
          : this.resolvedBy?.copyWith(),
      dateResolved:
          dateResolved is DateTime? ? dateResolved : this.dateResolved,
    );
  }
}
