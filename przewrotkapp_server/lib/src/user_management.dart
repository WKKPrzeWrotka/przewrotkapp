import 'package:markdown/markdown.dart';
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
      'email',
      // By default, user creation is locked down
      // But not here 😈
      (session, user, string) async => true,
    );
    if (newUser == null) {
      session.log(
        "Newly created user is null! What the hell?",
        level: LogLevel.error,
      );
      continue;
    }
    await EmailAuth.db.insertRow(
      session,
      EmailAuth(userId: newUser.id!, email: newUser.email!, hash: 'dupa12'),
    );
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
        // TODO: Change this message on Szkoleniówka
        html: markdownToHtml("""
# Siema 👋
Tu Mati Blue 🩵 (znaczy, jego bot)

Wprowadzamy w PrzeWrotce nową super apke do wypożyczania sprzętu 
- możesz powiedzieć pa pa przeklikiwaniu sie przez formularze 😎

Twoje konto zostało automatycznie stworzone na tegoż emaila - zrób sobie hasło 
przez opcje **"Reset hasła"**

Apka jest mega intuicyjna w użyciu, ale gdybyś miał z czymś problem czy pytania,
napisz śmiało do mnie:

- @matiii3i na Discordzie
- +48 577 294 391

## [https://app.przewrotka.org/](https://app.przewrotka.org/)
"""),
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
    (u) => (!skladki.map((s) => s.email).contains(u.email) && !u.blocked),
  )) {
    session.log(
      '$nieSkladkowicz nie ma skladki! Blokuje!',
      level: LogLevel.warning,
    );
    await Users.blockUser(session, nieSkladkowicz.id!);
    // TODO: Retry
    // Probably by scheduled event
    try {
      await sendEmail(
        session,
        nieSkladkowicz.email!,
        "Blokada konta PrzeWrotkApp 😢",
        "",
        html: markdownToHtml("""
# Hej... 😞
Tu Mati Blue 🩵 (znaczy, jego bot)

Twoje konto na PrzeWrotkApp zostało chwilowo zablokowane, 
przez nieopłaconą składkę 🥺

Znaczy to, że nie możesz wypożyczać ani przeglądać kajaczków... szkoda prawda?

Ale bez paniki...

## DA SIĘ TEMU ZARADZIĆ 🤩

Jeśli opłacisz swoją składkę u skarbnika, konto samo się przywróci!

Nie czekaj ani chwili! Zajrzyj na Discorda po najświeższe informacje,
gdzie ile komu wpłacić (na pewno nie dużo 😊), i gotowe 🌈

---

Psst, w razie wszelakich pytań, możesz odezwać się do mnie 
(w sensie, prawdziwego Matiego, nie bota) tutaj:

- @matiii3i na Discordzie
- +48 577 294 391

## Powodzenia 💪
"""),
      );
    } catch (e, s) {
      session.log(
        "Failed sending $nieSkladkowicz a blocked email!\n$e",
        stackTrace: s,
        level: LogLevel.error,
      );
    }
  }
}

class UsersManagementRefreshing extends FutureCall {
  static const callName = 'UsersManagementRefreshing';

  @override
  String get name => callName;

  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    if (!session.passwords.containsKey('googleApiToken')) {
      session.log(
        "Google Sheets API Token not in passwords.yaml! Cannot run automatic user management!",
        level: LogLevel.error,
      );
      return;
    }

    try {
      final skladki = await getSkladkaEmails(
        session.passwords['googleApiToken'] ?? '',
        session: session,
      );
      await createNewSkladkaUsers(session, skladki);
      await blockNonSkladkaUsers(session, skladki);
      await schedule(session.serverpod);
    } catch (_) {
      await schedule(session.serverpod);
      rethrow;
    }
  }

  static Future<void> schedule(
    Serverpod pod, {
    Duration delay = const Duration(hours: 1),
  }) async {
    await pod.cancelFutureCall(callName);
    await pod.futureCallWithDelay(callName, null, delay, identifier: callName);
  }
}
