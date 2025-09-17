import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'data_types.dart';

late String serverUrl;
late Client _client;
late SessionManager _sessionManager;

Future<void> initDi() async {
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  serverUrl = serverUrlFromEnv.isEmpty
      ? kReleaseMode
          ? 'https://api.app.przewrotka.lastgimbus.com/'
          : 'http://localhost:8080/'
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
        FutureProvider<AllGearCache?>(
          lazy: false,
          initialData: null,
          create: (_) => _retryFuture(() => getAllGear()),
        ),
        StreamProvider<FutureRentals?>(
          lazy: false,
          initialData: null,
          create: (_) =>
              _retryStream(() => _client.rental.watchRentals(past: false)),
        ),
        StreamProvider<SelfExtraUserInfo?>(
          lazy: false,
          initialData: null,
          create: (_) => _retryStream(() => _client.user.watchExtraUserInfo()),
        ),
        ProxyProvider2<AllGearCache?, SelfExtraUserInfo?, UserFavourites?>(
          lazy: false,
          create: (_) => null,
          update:
              (_, AllGearCache? allGearCache, ExtraUserInfo? extraUser, __) {
            if (allGearCache == null ||
                extraUser?.favouritesJunctions == null) {
              return null;
            }
            final favIds =
                extraUser!.favouritesJunctions!.map((e) => e.gearId).toList();
            final gear =
                allGearCache.where((g) => favIds.contains(g.gear.id)).toList();
            return (gearPairs: gear, gearIds: favIds);
          },
        ),
      ],
      child: child,
    );
  }
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
