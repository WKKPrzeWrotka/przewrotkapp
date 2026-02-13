import 'package:flutter/material.dart';

/// This allows us to override both themes
ThemeData _customize(Brightness brightness) {
  final t = ThemeData(
    colorSchemeSeed: Colors.blue,
    brightness: brightness,
    dividerTheme: DividerThemeData(space: 32),
  );
  final tt = t.textTheme;
  return t.copyWith(
    textTheme: tt.copyWith(
      // This is some boilerplate to easily customize them later
      // Display
      displaySmall: tt.displaySmall!.copyWith(),
      displayMedium: tt.displayMedium!.copyWith(),
      displayLarge: tt.displayLarge!.copyWith(),
      // Headlines
      headlineSmall: tt.headlineSmall!.copyWith(),
      headlineMedium: tt.headlineMedium!.copyWith(),
      headlineLarge: tt.headlineLarge!.copyWith(),
      // Title
      titleSmall: tt.titleSmall!.copyWith(),
      titleMedium: tt.titleMedium!.copyWith(),
      titleLarge: tt.titleLarge!.copyWith(),
      // Body
      bodySmall: tt.bodySmall!.copyWith(),
      bodyMedium: tt.bodyMedium!.copyWith(),
      bodyLarge: tt.bodyLarge!.copyWith(),
      // Label
      labelSmall: tt.labelSmall!.copyWith(),
      labelMedium: tt.labelMedium!.copyWith(),
      labelLarge: tt.labelLarge!.copyWith(),
    ),
  );
}

ThemeData get lightTheme => _customize(Brightness.light);

ThemeData get darkTheme => _customize(Brightness.dark);
