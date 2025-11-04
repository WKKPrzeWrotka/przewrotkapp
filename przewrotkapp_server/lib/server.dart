import 'package:markdown/markdown.dart';
import 'package:przewrotkapp_server/image_management.dart';
import 'package:przewrotkapp_server/src/events_endpoint.dart';
import 'package:przewrotkapp_server/src/user_management.dart';
import 'package:przewrotkapp_server/src/web/routes/root.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/utils.dart';

// This is the starting point of your Serverpod server. In most cpt4S9hases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );
  sendValidationEmail(session, email, code) => sendEmail(
    session,
    email,
    'PrzeWrotkApp - $code to kod potwierdzenia',
    '',
    html: markdownToHtml(
      'Siema, kod do PrzeWrotkApp\'a to:\n\n'
      '# $code',
    ),
  );
  auth.AuthConfig.set(
    auth.AuthConfig(
      userImageSize: 256,
      sendValidationEmail: (session, email, code) =>
          sendValidationEmail(session, email, code),
      sendPasswordResetEmail: (session, user, code) =>
          sendValidationEmail(session, user.email!, code),
      validationCodeLength: 6,
      minPasswordLength: 6,
      // Block user creation
      onUserWillBeCreated: (session, user, string) async => false,
      onUserCreated: (session, user) async {
        try {
          await PrzeUser.db.insertRow(
            session,
            PrzeUser(userId: user.id!, socialLinks: <String, Uri>{}),
          );
        } catch (e, s) {
          session.log(
            "FAILED TO CREATE EXTRA USER!! UserInfo: $user ; Session: $session",
            level: LogLevel.error,
            exception: e,
            stackTrace: s,
          );
          session.log(
            "DELETING USERINFO STUFF BECAUSE OF FAILED EXTRA!",
            level: LogLevel.error,
          );
          await auth.Users.blockUser(session, user.id!);
          await auth.UserInfo.db.deleteRow(session, user);
          await PrzeUser.db.deleteWhere(
            session,
            where: (e) => e.userId.equals(user.id),
          );
          await auth.EmailAuth.db.deleteWhere(
            session,
            where: (e) => e.userId.equals(user.id),
          );
          await auth.UserImage.db.deleteWhere(
            session,
            where: (e) => e.userId.equals(user.id),
          );
          rethrow;
        }
      },
    ),
  );

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();

  pod.registerFutureCall(
    ImagesRefreshFutureCall(),
    ImagesRefreshFutureCall.callName,
  );
  if (pod.runMode == ServerpodRunMode.production) {
    // Discord integration
    final dcEvents = DiscordEventsFutureCall();
    pod.registerFutureCall(dcEvents, dcEvents.name);
    await DiscordEventsFutureCall.schedule(
      pod,
      delay: Duration(milliseconds: 1),
    );
    // Auto user management
    final userRefresh = UsersManagementRefreshing();
    pod.registerFutureCall(userRefresh, userRefresh.name);
    await UsersManagementRefreshing.schedule(
      pod,
      delay: Duration(microseconds: 1),
    );
  }
}
