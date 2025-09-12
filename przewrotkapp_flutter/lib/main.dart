import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/pages/calendar_page.dart';
import 'package:przewrotkapp_flutter/ui/pages/gear_browser/gear_browser_page.dart';
import 'package:przewrotkapp_flutter/ui/pages/sign_in/sign_in_page.dart';
import 'package:przewrotkapp_flutter/ui/pages/user/user_page.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late String serverUrl;
late Client _client;
late SessionManager _sessionManager;
late GoRouter _router;

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

  _router = GoRouter(
    redirect: (context, state) {
      if (!context.read<SessionManager>().isSignedIn) {
        return '/signin';
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => '/gear',
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MyHomePage(child: child);
        },
        routes: [
          GoRoute(
            path: '/gear',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: GearBrowserPage()),
          ),
          GoRoute(
            path: '/calendar',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: CalendarPage()),
          ),
          GoRoute(
            path: '/user/:userId',
            pageBuilder: (context, state) => NoTransitionPage(
              child: UserPage(
                userId: int.parse(state.pathParameters['userId']!),
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/signin',
        redirect: (context, __) {
          if (context.read<SessionManager>().isSignedIn) {
            return '/';
          } else {
            return null;
          }
        },
        builder: (context, state) => SignInPage(),
      ),
    ],
  );

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
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'PrzeWrotkApp',
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Widget child;

  const MyHomePage({super.key, required this.child});

  @override
  MyHomePageState createState() => MyHomePageState();
}

enum _HomePages {
  gearBrowser,
  calendar,
  userAccount,
}

class MyHomePageState extends State<MyHomePage> {
  var _currentPage = _HomePages.gearBrowser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PrzeWrotkApp')),
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPage.index,
        destinations: [
          NavigationDestination(icon: Icon(Icons.kayaking), label: 'Gear'),
          NavigationDestination(
              icon: Icon(Icons.calendar_month), label: 'Calendar'),
          NavigationDestination(
              icon: Icon(Icons.account_box), label: 'Your account'),
        ],
        onDestinationSelected: (i) {
          _currentPage = _HomePages.values[i];
          context.go(switch (_currentPage) {
            _HomePages.gearBrowser => '/gear',
            _HomePages.calendar => '/calendar',
            _HomePages.userAccount =>
              '/user/${context.read<SessionManager>().signedInUser!.id}',
          });
        },
      ),
    );
  }
}
