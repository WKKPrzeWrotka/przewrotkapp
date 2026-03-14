import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'di.dart';
import 'logic/data_types.dart';
import 'routing.dart';
import 'ui/theme.dart';
import 'ui/utils/prze_provider_listener.dart';

void main() async {
  await initDi();
  initRouter();
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  // in case gearCache takes way too long to load
  Future.delayed(
    Duration(seconds: 3),
  ).then((_) => FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EverythingProvider(
      // When gearCache will load, only then remove splash screen
      child: PrzeProviderListener<AllGearCache?>(
        listener: (newValue) {
          if (newValue != null) {
            // ...after tiny delay, because other providers need to load too
            // perfect would be to listen to all of them, but i'm too lazy for
            // that and gearCache is the most important one
            Future.delayed(
              Duration(milliseconds: 250),
            ).then((_) => FlutterNativeSplash.remove());
          }
        },
        child: MaterialApp.router(
          routerConfig: router,
          title: 'PrzeWrotkApp',
          theme: lightTheme,
          darkTheme: darkTheme,
        ),
      ),
    );
  }
}
