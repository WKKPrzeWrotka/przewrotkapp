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
    return MultiProvider(
      providers: [
        Provider<Client>(create: (_) => _client),
        ChangeNotifierProvider<SessionManager>(create: (_) => _sessionManager),
        // Maybe wrap it in some container class to indicate what it is
        FutureProvider<List<GearPair>?>(
          initialData: null,
          create: (_) {
            // TODO: Retry on fail
            return _client.gearRead.getAllGear();
          },
        ),
        StreamProvider<List<Rental>?>(
          initialData: null,
          create: (_) => _client.rental.watchRentals(past: false),
        ),
        StreamProvider<ExtraUserInfo?>(
          initialData: null,
          create: (_) => _client.user.watchExtraUserInfo(),
        ),
      ],
      child: child,
    );
  }
}
