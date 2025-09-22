import 'dart:async';

import 'package:nyxx/nyxx.dart';
import 'package:serverpod/serverpod.dart';

typedef DiscordEvent = ({
  String name,
  DateTime from,
  DateTime to,
});

var discordEventsCache = <DiscordEvent>[];

class Events extends Endpoint {
  Future<List<DiscordEvent>> getDiscordEvents(Session session,
          {bool past = false}) async =>
      discordEventsCache;
}

class DiscordEventsFutureCall extends FutureCall {
  static const callName = 'DiscordEvents fetch';

  @override
  String get name => callName;

  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    if (!session.passwords.containsKey('discordBotToken')) {
      session.log(
        'No Discord Bot token - add it to enable Discord Calendar events!',
        level: LogLevel.warning,
      );
      return;
    }
    try {
      final client = await Nyxx.connectGateway(
        session.passwords['discordBotToken']!,
        GatewayIntents.allUnprivileged,
      );
      final przewrotkaServer = PartialGuild(
        id: Snowflake(1173934359376576604),
        manager: client.guilds,
      );
      discordEventsCache = (await przewrotkaServer.scheduledEvents.list())
          .map(
            (e) => (
              name: e.name,
              from: e.scheduledStartTime,
              to: e.scheduledEndTime ?? e.scheduledStartTime
            ),
          )
          // Last 30 days max
          .where((e) => e.to.difference(DateTime.now()).inDays > -30)
          .toList();
      await schedule(session.serverpod);
    } catch (e) {
      await schedule(session.serverpod, delay: Duration(minutes: 1));
    }
  }

  static Future<void> schedule(Serverpod pod,
          {Duration delay = const Duration(minutes: 5)}) =>
      pod.futureCallWithDelay(callName, null, delay);
}
