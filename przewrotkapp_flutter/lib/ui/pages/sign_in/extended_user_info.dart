import 'package:serverpod_auth_client/module.dart';

class ExtendedUserInfo {
  UserInfo? userInfo;
  AuthenticationFailReason? failReason;

  ExtendedUserInfo({required this.userInfo, required this.failReason});
}