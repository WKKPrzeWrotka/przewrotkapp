import 'dart:async';

import 'package:przewrotkapp_server/src/generated/protocol.dart';
import 'package:przewrotkapp_server/src/utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class UserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _userUpdateCtrl = StreamController<int>.broadcast();

  Future<UserInfoPublic> getUserInfo(Session session, int userId) async {
    return (await Users.findUserByUserId(session, userId))!.toPublic();
  }

  Future<ExtraUserInfo> getExtraUserInfo(Session session, [int? userId]) async {
    final id = userId ?? (await session.authenticated)!.userId;
    return (await ExtraUserInfo.db.findFirstRow(
      session,
      where: (user) => user.userInfoId.equals(id),
      include: ExtraUserInfo.include(userInfo: UserInfo.include()),
    ))!;
  }

  Stream<ExtraUserInfo> watchExtraUserInfo(
    Session session, [
    int? userId,
  ]) async* {
    final id = userId ?? (await session.authenticated)!.userId;
    yield* watchX(
      () => getExtraUserInfo(session, id),
      _userUpdateCtrl.stream.where((e) => e == id),
    );
  }

  Future<void> updateGearFavourite(
    Session session,
    Gear gear,
    bool isFavourite,
  ) async {
    final id = (await session.authenticated)!.userId;
    try {
      if (isFavourite) {
        await FavouritesJunction.db.insertRow(
          session,
          FavouritesJunction(gearId: gear.id!, userId: id),
        );
      } else {
        await FavouritesJunction.db.deleteWhere(
          session,
          where: (fj) => fj.gearId.equals(gear.id) & fj.userId.equals(id),
        );
      }
    } finally {
      // no catch because i do want to throw de error
      _userUpdateCtrl.add(id);
    }
  }

  Future<void> updateUser(Session session, ExtraUserInfo extraUser) async {
    final id = (await session.authenticated)!.userId;
    final newUser = extraUser.userInfo!;
    if (id != extraUser.userInfoId) throw "Can't update user other than you";
    if (newUser.userName != null) {
      await Users.changeUserName(session, id, newUser.userName!);
    }
    if (newUser.fullName != null) {
      await Users.changeFullName(session, id, newUser.fullName!);
    }
    await session.db.transaction((t) async {
      final currExtra = await ExtraUserInfo.db.findFirstRow(
        session,
        where: (e) => e.userInfoId.equals(id),
        transaction: t,
      );
      await ExtraUserInfo.db.updateRow(
        session,
        // i do this manually to make sure user doesn't edit their ids etc
        currExtra!.copyWith(
          phoneNumber: extraUser.phoneNumber,
          socialLinks: extraUser.socialLinks,
        ),
        transaction: t,
      );
    });
    _userUpdateCtrl.add(id);
  }

  Future<List<int>> getFavourites(Session session) async {
    final id = (await session.authenticated)!.userId;
    return (await FavouritesJunction.db.find(
      session,
      where: (fj) => fj.userId.equals(id),
      orderByList: (fj) => [
        Order(column: fj.gear.type),
        Order(column: fj.gear.clubId),
      ],
    )).map((fj) => fj.gearId).toList();
  }

  Stream<List<int>> watchFavourites(Session session) =>
      watchX(() => getFavourites(session), _userUpdateCtrl.stream);

  Future<List<Hour>> getHours(Session session, {int? userId}) => Hour.db.find(
    session,
    where: userId != null ? (h) => h.userId.equals(userId) : null,
  );

  Stream<List<Hour>> watchHours(Session session, {int? userId}) => watchX(
    () => getHours(session, userId: userId),
    _userUpdateCtrl.stream.where(
      userId != null ? (e) => e == userId : (_) => true,
    ),
  );

  Future<int> getHoursSum(Session session, int userId) => session.db
      .unsafeQuery(
        'SELECT SUM(amount) FROM hours '
        'WHERE "userId" = ${EscapedExpression(userId)} '
        'AND approved = true',
      )
      .then(
        (res) => res.first.first is String ? int.parse(res.first.first) : 0,
      );

  Stream<int> watchHoursSum(Session session, int userId) => watchX(
    () => getHoursSum(session, userId),
    _userUpdateCtrl.stream.where((e) => e == userId),
  );
}
