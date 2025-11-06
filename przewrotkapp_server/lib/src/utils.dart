import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod/serverpod.dart';

final _smtpServer = gmail(
  Serverpod.instance.getPassword('serverEmail') ?? '',
  Serverpod.instance.getPassword('serverEmailPassword') ?? '',
);

Future<bool> sendEmail(
  Session session,
  String email,
  String subject,
  String text, {
  String? html,
}) async {
  if (session.serverpod.runMode != ServerpodRunMode.production &&
      !bool.fromEnvironment('REALLY_SEND_EMAILS')) {
    session.log(
      "Not sending emails in non-production mode\n"
      "To override, set --define REALLY_SEND_EMAILS=true",
      level: LogLevel.warning,
    );
    return true;
  }
  final message = Message()
    ..from = Address(Serverpod.instance.getPassword('serverEmail')!)
    ..recipients.add(email)
    ..subject = subject
    ..html = html
    ..text = text;
  try {
    final sendReport = await send(message, _smtpServer);
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

extension Defaults on DateTime {
  DateTime withDefaultRentalFromTime() => copyWith(
    hour: 4,
    minute: 0,
    second: 0,
    millisecond: 0,
    microsecond: 0,
    isUtc: true,
  );

  DateTime withDefaultRentalToTime() => copyWith(
    hour: 21,
    minute: 0,
    second: 0,
    millisecond: 0,
    microsecond: 0,
    isUtc: true,
  );
}

Stream<T> watchX<T>(Future<T> Function() getX, Stream updateStream) async* {
  yield await getX();
  await for (final _ in updateStream) {
    yield await getX();
  }
}

extension SuperPrzeScope on PrzeScope {
  Scope toScope() => Scope(name);
}

extension SuperSuperPrzeScope on Set<PrzeScope> {
  Set<Scope> toScopes() => map((e) => e.toScope()).toSet();
}
