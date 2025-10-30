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

abstract class ExtraUserInfo implements _i1.SerializableModel {
  ExtraUserInfo._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    this.phoneNumber,
    this.discordUsername,
    required this.socialLinks,
  });

  factory ExtraUserInfo({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    required Map<String, Uri> socialLinks,
  }) = _ExtraUserInfoImpl;

  factory ExtraUserInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return ExtraUserInfo(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
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

  int userInfoId;

  _i2.UserInfo? userInfo;

  String? phoneNumber;

  String? discordUsername;

  Map<String, Uri> socialLinks;

  /// Returns a shallow copy of this [ExtraUserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExtraUserInfo copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    Map<String, Uri>? socialLinks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
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

class _ExtraUserInfoImpl extends ExtraUserInfo {
  _ExtraUserInfoImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? phoneNumber,
    String? discordUsername,
    required Map<String, Uri> socialLinks,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          phoneNumber: phoneNumber,
          discordUsername: discordUsername,
          socialLinks: socialLinks,
        );

  /// Returns a shallow copy of this [ExtraUserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExtraUserInfo copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? phoneNumber = _Undefined,
    Object? discordUsername = _Undefined,
    Map<String, Uri>? socialLinks,
  }) {
    return ExtraUserInfo(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
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
