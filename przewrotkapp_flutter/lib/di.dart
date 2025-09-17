import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

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
    connectionTimeout: Duration(seconds: 1),
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
  _sessionManager = SessionManager(caller: _client.modules.auth);
  await _sessionManager.initialize();

  if (kIsWeb) {
    usePathUrlStrategy();
  }
}

Future<T> _retryFuture<T>(
  Future<T> Function() create, [
  Duration retryTime = const Duration(seconds: 1),
]) async {
  while (true) {
    try {
      return await create();
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

class EverythingProvider extends StatelessWidget {
  final Widget child;

  const EverythingProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Client>(create: (_) => _client),
        ChangeNotifierProvider<SessionManager>(create: (_) => _sessionManager),
        // Maybe wrap it in some container class to indicate what it is
        FutureProvider<List<GearPair>?>(
          lazy: false,
          initialData: null,
          create: (_) => _retryFuture(() => _client.gearRead.getAllGear()),
        ),
        StreamProvider<List<Rental>?>(
          lazy: false,
          initialData: null,
          create: (_) =>
              _retryStream(() => _client.rental.watchRentals(past: false)),
        ),
        StreamProvider<ExtraUserInfo?>(
          lazy: false,
          initialData: null,
          create: (_) => _retryStream(() => _client.user.watchExtraUserInfo()),
        ),
      ],
      child: child,
    );
  }
}
