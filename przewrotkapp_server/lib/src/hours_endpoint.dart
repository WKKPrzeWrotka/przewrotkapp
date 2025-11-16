import 'dart:async';

import 'package:przewrotkapp_client/przewrotkapp_client.dart' hide Hour;
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

import 'generated/hour.dart';
import 'utils.dart';

/// Send a userId here for user which was updated
final hoursUpdateCtrl = StreamController<int>.broadcast();

class HoursEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Hour>> getHours(Session session, {int? userId}) => Hour.db.find(
    session,
    where: userId != null
        ? (h) => h.userId.equals(userId) & h.approved.equals(true)
        : (h) => h.approved.equals(true),
    orderBy: (h) => h.date,
    orderDescending: true,
    include: Hour.include(user: UserInfo.include()),
  );

  Stream<List<Hour>> watchHours(Session session, {int? userId}) => watchX(
    () => getHours(session, userId: userId),
    hoursUpdateCtrl.stream.where(
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
    hoursUpdateCtrl.stream.where((e) => e == userId),
  );

  Future<void> claimHour(Session session, Hour hour) async {
    final auth = (await session.authenticated)!;
    final callingUserId = auth.userId;
    final isGodzinkowy = auth.scopes
        .map((e) => e.name ?? 'dupa')
        .contains(PrzeScope.godzinkowy.name);
    if (callingUserId != hour.userId && !isGodzinkowy) {
      throw PrzException(
        message: "Only godzinowy can claim hours for someone else",
      );
    }
    if (hour.approved == true && !isGodzinkowy) {
      throw PrzException(message: "Only godzinkowy can approve hours");
    }
    await Hour.db.insertRow(session, hour);
    hoursUpdateCtrl.add(hour.userId);
  }
}
