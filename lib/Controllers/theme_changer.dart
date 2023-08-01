import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pantry_app/Controllers/dark_mode_controller.dart';
import 'package:pantry_app/dynamic_theme.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  DarkModeOption _darkModeOption;

  ThemeChanger(
      {required ThemeData themeData, required DarkModeOption darkModeOption})
      : _themeData = themeData,
        _darkModeOption = darkModeOption;

  ThemeData getTheme() => _themeData;
  DarkModeOption get getDarkModeOption => _darkModeOption;

  void setTheme(ThemeData themeData, DarkModeOption darkModeOption) {
    _themeData = themeData;
    _darkModeOption = darkModeOption;
    notifyListeners();
  }

  // Save the theme preference to shared preferences
  _saveThemePreference(DarkModeOption option) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('darkModeOption', option.index);
  }

  // Load the theme preference from shared preferences
  static Future<DarkModeOption> loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    int optionIndex =
        prefs.getInt('darkModeOption') ?? DarkModeOption.system.index;
    return DarkModeOption.values[optionIndex];
  }

  void setDarkModeOption(DarkModeOption option) {
    _darkModeOption = option;
    _saveThemePreference(option);
    switch (option) {
      case DarkModeOption.dark:
        setTheme(DynamicTheme.darkTheme, DarkModeOption.dark);
        break;
      case DarkModeOption.light:
        setTheme(DynamicTheme.lightTheme, DarkModeOption.light);
        break;
      case DarkModeOption.system:
        setSystemTheme();
        break;
    }
  }

  setSystemTheme() {
    if (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark) {
      _themeData = DynamicTheme.darkTheme;
    } else {
      _themeData = DynamicTheme.lightTheme;
    }
    _darkModeOption = DarkModeOption.system;
    notifyListeners();
  }
}
