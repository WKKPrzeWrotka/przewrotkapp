import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:rxdart/rxdart.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'logic/data_types.dart';
import 'logic/utils.dart';

late String serverUrl;
late Client _client;
late SessionManager _sessionManager;

Future<void> initDi() async {
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  serverUrl = serverUrlFromEnv.isEmpty
      ? kReleaseMode
            ? 'https://api.app.przewrotka.org/'
            : 'https://api.app.przewrotka.org/'
      : serverUrlFromEnv;

  _client = Client(
    serverUrl,
    connectionTimeout: const Duration(seconds: 10),
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
  _sessionManager = SessionManager(caller: _client.modules.auth);
  await _sessionManager.initialize();

  if (kIsWeb) {
    usePathUrlStrategy();
  }
}

class EverythingProvider extends StatelessWidget {
  final Widget child;

  const EverythingProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // WARNING: Different typedefs are recognized as equal if their actual types
    // are equal!! That means, if you will make a provider here for
    // typedef AllGear = List<Gear>
    // and another for
    // typedef OtherGear = List<Gear>
    // they will fight each other!!!
    return MultiProvider(
      providers: [
        Provider<Client>(create: (_) => _client),
        ChangeNotifierProvider<SessionManager>(create: (_) => _sessionManager),
        // Maybe wrap it in some container class to indicate what it is
        StreamProvider<AllGearCache?>(
          lazy: false,
          initialData: null,
          create: (_) => _retryStream(() => watchAllGear()),
        ),
        StreamProvider<FutureRentals?>(
          lazy: false,
          initialData: null,
          create: (_) =>
              _retryStream(() => _client.rental.watchRentals(past: false)),
        ),
        FutureProvider<List<DiscordEvent>?>(
          lazy: false,
          initialData: null,
          create: (_) =>
              _retryFuture(
                () => _client.events.getDiscordEvents(past: false),
              ).then(
                (e) => e
                    .map(
                      (event) => (
                        name: event.name,
                        from: event.from.toUtc(),
                        to: event.to.toUtc(),
                      ),
                    )
                    .toList(),
              ),
        ),
        StreamProvider<SelfPrzeUser?>(
          lazy: false,
          initialData: null,
          create: (_) => _retryStream(() => _client.user.watchPrzeUser()),
        ),
        StreamProvider<UserFavourites?>(
          lazy: false,
          initialData: null,
          create: (_) => _retryStream(
            () => _client.user.watchFavourites(),
          ).map((f) => UserFavourites(f)),
        ),
        ProxyProvider2<
          FutureRentals?,
          FutureDiscordEvents?,
          FutureRentalGroups?
        >(
          lazy: false,
          create: (_) => null,
          update: (_, rentals, dcEvents, _) {
            // should i await dc too?
            if (rentals == null || dcEvents == null) return null;
            final dcEventsCopy = dcEvents.toList();
            return rentals
                .groupListsBy(
                  (r) => DateTimeRange(
                    start: r.start,
                    end: r.end,
                  ).withDefaultRentalTimes(),
                )
                .entries
                .map((e) {
                  final dcEvent = dcEvents.firstWhereOrNull(
                    (dcEv) => DateTimeRange(
                      start: dcEv.from,
                      end: dcEv.to,
                    ).withDefaultRentalTimes().isSameDayRange(e.key),
                  );
                  dcEventsCopy.remove(dcEvent);
                  return RentalGroup(
                    name: dcEvent?.name,
                    range: e.key,
                    rentals: e.value,
                  );
                })
                .toList() // this is important because or .remove() above
                .followedBy(
                  dcEventsCopy.map(
                    (e) => RentalGroup(
                      name: e.name,
                      range: DateTimeRange(
                        start: e.from,
                        end: e.to,
                      ).withDefaultRentalTimes(),
                      rentals: [],
                    ),
                  ),
                )
                .toList();
          },
        ),
        StreamProvider<UnresolvedComments?>(
          lazy: false,
          initialData: null,
          create: (_) => _retryStream(
            () => _client.comments.watchComments(resolved: false),
          ),
        ),
      ],
      child: child,
    );
  }
}

Stream<List<GearPair>> watchAllGear() {
  return CombineLatestStream.list([
        _client.gearRead.watchAllBelts(),
        _client.gearRead.watchAllClothes(),
        _client.gearRead.watchAllFloatbags(),
        _client.gearRead.watchAllHelmets(),
        _client.gearRead.watchAllKayaks(),
        _client.gearRead.watchAllPaddles(),
        _client.gearRead.watchAllPfds(),
        _client.gearRead.watchAllSpraydecks(),
        _client.gearRead.watchAllThrowbags(),
      ])
      .debounceTime(Duration(milliseconds: 50))
      .map(
        (e) => e.flattenedToList
            .map((e) => GearPair(gear: e.$1, gearExtra: e.$2))
            .toList(),
      );
}

// Yes, this is necessary because turns out that Serverpod doesn't really
// understand it's own inheritance yet, and GearExtra was always empty and
// didn't really contain actual subtype data
Future<List<GearPair>> getAllGear() async {
  final allLists = await Future.wait([
    _client.gearRead.getAllBelts(),
    _client.gearRead.getAllClothes(),
    _client.gearRead.getAllFloatbags(),
    _client.gearRead.getAllHelmets(),
    _client.gearRead.getAllKayaks(),
    _client.gearRead.getAllPaddles(),
    _client.gearRead.getAllPfds(),
    _client.gearRead.getAllSpraydecks(),
    _client.gearRead.getAllThrowbags(),
  ]);
  return [
    for (final list in allLists) ...list,
  ].map((e) => GearPair(gear: e.$1, gearExtra: e.$2)).toList(growable: false);
}

Future<T> _retryFuture<T>(
  Future<T> Function() create, [
  Duration retryTime = const Duration(seconds: 1),
]) async {
  while (true) {
    try {
      final dupa = await create();
      return dupa;
    } catch (e) {
      print(e);
      await Future.delayed(retryTime);
    }
  }
}

Stream<T> _retryStream<T>(
  Stream<T> Function() create, [
  Duration retryTime = const Duration(seconds: 3),
]) async* {
  while (true) {
    try {
      await for (final event in create()) {
        yield event;
      }
    } catch (e) {
      print(e);
      await Future.delayed(retryTime);
    }
  }
}
