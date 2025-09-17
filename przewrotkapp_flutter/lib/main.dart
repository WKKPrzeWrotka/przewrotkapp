import 'package:flutter/material.dart';
import 'package:przewrotkapp_flutter/di.dart';
import 'package:przewrotkapp_flutter/routing.dart';

void main() async {
  await initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EverythingProvider(
      child: MaterialApp.router(
        routerConfig: router,
        title: 'PrzeWrotkApp',
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
