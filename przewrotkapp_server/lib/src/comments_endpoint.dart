import 'dart:async';

import 'package:przewrotkapp_server/src/utils.dart';
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
  }) =>
      watchX(() => getComments(session, resolved: resolved),
          _commentsUpdateCtrl.stream);
}
