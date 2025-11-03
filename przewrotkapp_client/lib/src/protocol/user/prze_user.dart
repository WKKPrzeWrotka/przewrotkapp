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

abstract class PrzeUser implements _i1.SerializableModel {
  PrzeUser._({
    this.id,
    required this.userId,
    this.user,
    this.phoneNumber,
    this.discordUsername,
    required this.socialLinks,
  });

  factory PrzeUser({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    String? phoneNumber,
    String? discordUsername,
    required Map<String, Uri> socialLinks,
  }) = _PrzeUserImpl;

  factory PrzeUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return PrzeUser(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      phoneNumber: jsonSerialization['phoneNumber'] as String?,
      discordUsername: jsonSerialization['discordUsername'] as String?,
      socialLinks:
          (jsonSerialization['socialLinks'] as Map).map((k, v) => MapEntry(
                k as String,
                _i1.UriJsonExtension.fromJson(v),
              )),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserInfo? user;

  String? phoneNumber;

  String? discordUsername;

  Map<String, Uri> socialLinks;

  /// Returns a shallow copy of this [PrzeUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PrzeUser copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    String? phoneNumber,
    String? discordUsername,
    Map<String, Uri>? socialLinks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (discordUsername != null) 'discordUsername': discordUsername,
      'socialLinks': socialLinks.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PrzeUserImpl extends PrzeUser {
  _PrzeUserImpl({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    String? phoneNumber,
    String? discordUsername,
    required Map<String, Uri> socialLinks,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          phoneNumber: phoneNumber,
          discordUsername: discordUsername,
          socialLinks: socialLinks,
        );

  /// Returns a shallow copy of this [PrzeUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PrzeUser copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? phoneNumber = _Undefined,
    Object? discordUsername = _Undefined,
    Map<String, Uri>? socialLinks,
  }) {
    return PrzeUser(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      discordUsername:
          discordUsername is String? ? discordUsername : this.discordUsername,
      socialLinks: socialLinks ??
          this.socialLinks.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}
