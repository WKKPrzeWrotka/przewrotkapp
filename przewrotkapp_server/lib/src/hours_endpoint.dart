import 'dart:async';

import 'package:serverpod/serverpod.dart';

import 'generated/hour.dart';
import 'utils.dart';

class HoursEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _hoursUpdateCtrl = StreamController<int>.broadcast();

  Future<List<Hour>> getHours(Session session, {int? userId}) => Hour.db.find(
    session,
    where: userId != null
        ? (h) => h.userId.equals(userId) & h.approved.equals(true)
        : (h) => h.approved.equals(true),
  );

  Stream<List<Hour>> watchHours(Session session, {int? userId}) => watchX(
    () => getHours(session, userId: userId),
    _hoursUpdateCtrl.stream.where(
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
    _hoursUpdateCtrl.stream.where((e) => e == userId),
  );
}
