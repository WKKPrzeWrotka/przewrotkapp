import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class UserEndpoint extends Endpoint {
  Future<UserInfoPublic> getUserInfo(Session session, int userId) async {
    return (await Users.findUserByUserId(session, userId))!.toPublic();
  }
}
