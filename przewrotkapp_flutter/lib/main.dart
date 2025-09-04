import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/pages/gear_browser/gear_browser_page.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late String serverUrl;

void main() {
  // When you are running the app on a physical device, you need to set the
  // server URL to the IP address of your computer. You can find the IP
  // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
  // You can set the variable when running or building your app like this:
  // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  serverUrl =
      serverUrlFromEnv.isEmpty ? 'https://api.app.przewrotka.lastgimbus.com/' : serverUrlFromEnv;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrzeWrotkApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Provider(
          create: (_) => Client(serverUrl)
            ..connectivityMonitor = FlutterConnectivityMonitor(),
          child: const MyHomePage(title: 'PrzeWrotkApp')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
      appBar: AppBar(title: Text(widget.title)),
      body: [
        GearBrowserPage(),
        Placeholder(),
        Placeholder(),
      ][_currentPage.index],
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
          setState(() {});
        },
      ),
    );
  }
}
