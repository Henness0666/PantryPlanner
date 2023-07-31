import 'package:flutter/material.dart';

class DynamicTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    // other theme data for light mode
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    // other theme data for dark mode
  );

  // This theme will be used as a placeholder until the real system theme is known
  static final ThemeData systemTheme = ThemeData(
    primarySwatch: Colors.blue,
    // other theme data for system theme
  );
}
