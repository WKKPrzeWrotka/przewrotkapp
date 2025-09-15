import 'package:przewrotkapp_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class UserEndpoint extends Endpoint {
  Future<UserInfoPublic> getUserInfo(Session session, int userId) async {
    return (await Users.findUserByUserId(session, userId))!.toPublic();
  }

  Future<ExtraUserInfo> getExtraUserInfo(Session session, [int? userId]) async {
    final id = userId ?? (await session.authenticated)!.userId;
    return (await ExtraUserInfo.db.findFirstRow(
      session,
      where: (user) => user.userInfoId.equals(id),
      include: ExtraUserInfo.include(
        userInfo: UserInfo.include(),
        favouritesJunctions: FavouritesJunction.includeList(
          include: FavouritesJunction.include(gear: Gear.include()),
        ),
      ),
    ))!;
  }
}
