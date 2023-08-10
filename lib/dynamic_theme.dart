import 'package:flutter/material.dart';

class DynamicTheme {
  static final MaterialColor customColorSwatch = createMaterialColor(const Color(0xFF296c65));

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: customColorSwatch,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF296c65),
      onPrimary: Colors.white,
      secondary: Color(0xFFf99a1d),
      onSecondary: Colors.white,
      onSurface: Colors.grey,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    // other theme data for light mode
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: customColorSwatch,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF296c65), // Set the primary color to white
      onPrimary: Colors.white, // Set the onPrimary color to black
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    // other theme data for dark mode
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
