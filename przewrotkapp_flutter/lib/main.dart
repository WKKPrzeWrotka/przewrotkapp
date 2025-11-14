import 'package:flutter/material.dart';

import 'di.dart';
import 'routing.dart';
import 'dart:html' as html; // Only for web

void main() async {
  await initDi();
  initRouter();
  disableImageLongPress();
  runApp(const MyApp());
}

void disableImageLongPress() {
  html.document.onContextMenu.listen((event) => event.preventDefault());
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
