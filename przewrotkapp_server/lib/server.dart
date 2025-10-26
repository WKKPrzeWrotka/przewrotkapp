import 'package:przewrotkapp_server/image_management.dart';
import 'package:przewrotkapp_server/src/events_endpoint.dart';
import 'package:przewrotkapp_server/src/web/routes/root.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/utils.dart';

// This is the starting point of your Serverpod server. In most cases, you will
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

  auth.AuthConfig.set(
    auth.AuthConfig(
      userImageSize: 256,
      sendValidationEmail: (session, email, code) => sendEmail(
        session,
        email,
        'PrzeWrotkApp - kod $code',
        'Siema, kod to $code',
      ),
      sendPasswordResetEmail: (session, user, code) => sendEmail(
        session,
        user.email!,
        'PrzeWrotkApp - kod $code',
        'Siema, kod to $code',
      ),
      validationCodeLength: 4,
      minPasswordLength: 6,
      onUserCreated: (session, userInfo) async {
        try {
          await ExtraUserInfo.db.insertRow(
            session,
            ExtraUserInfo(
              userInfoId: userInfo.id!,
              socialLinks: <String, Uri>{},
            ),
          );
        } catch (e, s) {
          session.log(
            "FAILED TO CREATE EXTRA USER!! UserInfo: $userInfo ; Session: $session",
            level: LogLevel.error,
            exception: e,
            stackTrace: s,
          );
          session.log(
            "DELETING USERINFO STUFF BECAUSE OF FAILED EXTRA!",
            level: LogLevel.error,
          );
          await auth.UserInfo.db.deleteRow(session, userInfo);
          await ExtraUserInfo.db.deleteWhere(
            session,
            where: (e) => e.userInfoId.equals(userInfo.id),
          );
          await auth.EmailAuth.db.deleteWhere(
            session,
            where: (e) => e.userId.equals(userInfo.id),
          );
          await auth.UserImage.db.deleteWhere(
            session,
            where: (e) => e.userId.equals(userInfo.id),
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

  pod.registerFutureCall(ImagesRefreshFutureCall(), ImagesRefreshFutureCall.callName);
  if (pod.runMode == ServerpodRunMode.production) {
    final dcEvents = DiscordEventsFutureCall();
    pod.registerFutureCall(dcEvents, dcEvents.name);
    await DiscordEventsFutureCall.schedule(
      pod,
      delay: Duration(milliseconds: 1),
    );
  }
}
