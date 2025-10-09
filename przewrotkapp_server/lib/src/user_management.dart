import 'package:przewrotkapp_server/src/sheets_connector.dart';
import 'package:przewrotkapp_server/src/utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

// TODO: Actually execute it somewhere

Future<void> createNewSkladkaUsers(
  Session session,
  List<Skladkowicz> skladki,
) async {
  final existingUsers = await UserInfo.db.find(session);
  final existingUserEmails = existingUsers.map((u) => u.email!);
  final nowi = skladki.where((s) => !existingUserEmails.contains(s.email));
  session.log(
    'There are ${nowi.length} new skladkowiczes - creating them now...',
  );
  for (final newSkladkowicz in nowi) {
    session.log('Creating $newSkladkowicz account...', level: LogLevel.debug);
    final fullName = [?newSkladkowicz.imie, ?newSkladkowicz.nazwisko].join(' ');
    final newUser = await Users.createUser(
      session,
      UserInfo(
        userIdentifier: newSkladkowicz.email,
        userName: newSkladkowicz.ksywa,
        fullName: fullName.isNotEmpty ? fullName : null,
        email: newSkladkowicz.email,
        created: DateTime.now(),
        scopeNames: [],
        blocked: false,
      ),
    );
    if (newUser == null) {
      session.log(
        "Newly created user is null! What the hell?",
        level: LogLevel.error,
      );
      continue;
    }
    session.log(
      "Sending $newUser email about account creation...",
      level: LogLevel.debug,
    );
    // TODO: Retry
    // Probably by scheduled event
    try {
      await sendEmail(
        session,
        newUser.email!,
        "Utworzenie konta PrzeWrotkApp 🛶",
        "",
        html:
            '<h1>Siema 👋</h1>'
            '<p>Tu Mati Blue 🩵 (znaczy, jego bot)</p>'
            '<p>Wprowadzamy w PrzeWrotce nową super apke do wypożyczania '
            'sprzętu - możesz powiedzieć pa pa przeklikiwaniu sie przez '
            'formularze 😎</p>'
            '<p>Twoje konto zostało automatycznie stworzone na tegoż emaila - '
            'zrób sobie hasło przez opcje <b>"Reset hasła"</b></p>'
            '<p>Apka jest mega intuicyjna w użyciu, ale gdybyś miał z czymś '
            'problem czy pytania, napisz śmiało do mnie:</p>'
            '<p>'
            '@matiii3i na Discordzie<br>'
            '+48 577 294 391'
            '</p>'
            '<h2><a href="https://app.przewrotka.org/">'
            'https://app.przewrotka.org/'
            '</a></h2>',
      );
    } catch (e, s) {
      session.log(
        "Failed sending $newUser a welcome email!\n$e",
        stackTrace: s,
        level: LogLevel.error,
      );
    }
  }
}

Future<void> blockNonSkladkaUsers(
  Session session,
  List<Skladkowicz> skladki,
) async {
  final existingUsers = await UserInfo.db.find(session);
  for (final nieSkladkowicz in existingUsers.where(
    (u) => !skladki.map((s) => s.email).contains(u.email),
  )) {
    session.log(
      '$nieSkladkowicz nie ma skladki! Blokuje!',
      level: LogLevel.warning,
    );
    await Users.blockUser(session, nieSkladkowicz.id!);
  }
}
