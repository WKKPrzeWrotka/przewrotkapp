import 'dart:async';

import 'package:przewrotkapp_client/scopes.dart';
import 'package:przewrotkapp_server/src/gear_read_endpoint.dart';
import 'package:przewrotkapp_server/src/utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

import 'generated/protocol.dart';

class CommentsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _commentsUpdateCtrl = StreamController<bool>.broadcast();

  Future<List<Comment>> getComments(Session session, {bool resolved = false}) =>
      Comment.db.find(
        session,
        where: resolved ? null : (c) => c.resolved.equals(false),
        include: Comment.include(
          by: UserInfo.include(),
          // Don't include gear because we already have it all over the place
          resolvedBy: UserInfo.include(),
        ),
      );

  Stream<List<Comment>> watchComments(
    Session session, {
    bool resolved = false,
  }) => watchX(
    () => getComments(session, resolved: resolved),
    _commentsUpdateCtrl.stream,
  );

  /// Will throw exception if not allowed
  Future<void> _commentEditAllowedCheck(
    Session session,
    Comment comment,
  ) async {
    final auth = (await session.authenticated)!;
    final user = await Users.findUserByUserId(session, auth.userId);
    var isScopeAllowed =
        (user!.scopeNames.contains(PrzeScope.sprzetowiec.name) ||
        user.scopeNames.contains(PrzeScope.zarzad.name));
    if (!isScopeAllowed && comment.id != null) {
      // Check if user is at least the author of the comment - otherwise throw
      final existing = await Comment.db.findById(session, comment.id!);
      if (existing != null && existing.byId == user.id!) return;
      throw PrzException(
        message: "Comments can be edited by sprzętowiec, zarząd, or the author",
      );
    }
  }

  Future<void> createOrUpdateComment(Session session, Comment comment) async {
    // Only check for permissions on edit - allow creation by anyone
    if (comment.id != null) await _commentEditAllowedCheck(session, comment);
    await insertOrUpdate<Comment>(session, comment);
    _commentsUpdateCtrl.add(true);
    if (comment.gearId != null) gearUpdateCtrl.add(true);
  }

  Future<void> deleteComment(Session session, Comment comment) async {
    await _commentEditAllowedCheck(session, comment);
    await Comment.db.deleteRow(session, comment);
    _commentsUpdateCtrl.add(true);
    if (comment.gearId != null) gearUpdateCtrl.add(true);
  }
}
