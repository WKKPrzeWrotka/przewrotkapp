import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/routing.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late String serverUrl;
late Client _client;
late SessionManager _sessionManager;

void main() async {
  // When you are running the app on a physical device, you need to set the
  // server URL to the IP address of your computer. You can find the IP
  // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
  // You can set the variable when running or building your app like this:
  // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  serverUrl = serverUrlFromEnv.isEmpty
      ? 'https://api.app.przewrotka.lastgimbus.com/'
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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'PrzeWrotkApp',
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
