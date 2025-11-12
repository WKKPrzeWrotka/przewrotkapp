import 'dart:async';

import 'package:nyxx/nyxx.dart';
import 'package:przewrotkapp_server/src/utils.dart';
import 'package:serverpod/serverpod.dart';

typedef DiscordEvent = ({String name, DateTime start, DateTime end});

var discordEventsCache = <DiscordEvent>[];

class Events extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<DiscordEvent>> getDiscordEvents(
    Session session, {
    bool past = false,
  }) async => discordEventsCache;
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
              // The .toLocal() is important because Karolina sometimes creates
              // events that end at 00:00 midnight, and Discord API then serves
              // them at 22:00 previous day.
              // So, first, convert them to local, force-set time to 04:00 and
              // mark *that* as utc 😌
              start: e.scheduledStartTime.toLocal().withDefaultRentalFromTime(),
              end:
                  (e.scheduledEndTime?.toLocal() ??
                          e.scheduledStartTime.toLocal())
                      .withDefaultRentalToTime(),
            ),
          )
          // Last 30 days max
          .where((e) => e.end.difference(DateTime.now()).inDays > -30)
          .toList();
      discordEventsCache.sort(
        (a, b) => a.start.millisecondsSinceEpoch.compareTo(
          b.start.millisecondsSinceEpoch,
        ),
      );
    } catch (e) {
      session.log(e.toString(), level: LogLevel.error);
    }
    await schedule(session.serverpod);
  }

  static Future<void> schedule(
    Serverpod pod, {
    Duration delay = const Duration(minutes: 30),
  }) async {
    await pod.cancelFutureCall(callName);
    await pod.futureCallWithDelay(callName, null, delay, identifier: callName);
  }
}
