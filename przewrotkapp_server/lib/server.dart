import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:przewrotkapp_server/src/excel_migration/insert_photo_urls.dart';
import 'package:przewrotkapp_server/src/web/routes/root.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

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

  final smtpServer = gmail(
    Serverpod.instance.getPassword('serverEmail') ?? '',
    Serverpod.instance.getPassword('serverEmailPassword') ?? '',
  );
  Future<bool> sendEmail(
      Session session, String email, String subject, String text) async {
    final message = Message()
      ..from = Address(Serverpod.instance.getPassword('serverEmail')!)
      ..recipients.add(email)
      ..subject = subject
      ..text = text;
    try {
      final sendReport = await send(message, smtpServer);
      session.log('Email message sent: $sendReport');
      return true;
    } on MailerException catch (e) {
      session.log('Message not sent: $e', level: LogLevel.error);
      for (var p in e.problems) {
        session.log('Problem: ${p.code}: ${p.msg}', level: LogLevel.error);
      }
    }
    return false;
  }

  auth.AuthConfig.set(
    auth.AuthConfig(
      userImageSize: 512,
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

  await insertPhotoUrls(
    await pod.createSession(),
    Uri.parse('https://static.app.przewrotka.lastgimbus.com/gear_photos/'),
    Directory(
        '/var/www/html/static.app.przewrotka.lastgimbus.com/gear_photos'),
  );

  // Start the server.
  await pod.start();
}
