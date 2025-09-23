import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

import 'generated/protocol.dart';

class CommentsEndpoint extends Endpoint {
  final _commentsUpdateCtrl = StreamController<bool>.broadcast();

  Future<List<Comment>> getComments(Session session, {bool resolved = false}) =>
      Comment.db.find(
        session,
        where: resolved ? null : (c) => c.resolved.equals(false),
        include: Comment.include(
          by: UserInfo.include(),
          // Don't include gear because we already have it all over the place
          // gear: Gear.include(),
          resolvedBy: UserInfo.include(),
        ),
      );

  Stream<List<Comment>> watchComments(
    Session session, {
    bool resolved = false,
  }) async* {
    yield await getComments(session, resolved: resolved);
    await for (final _ in _commentsUpdateCtrl.stream) {
      yield await getComments(session, resolved: resolved);
    }
  }
}
