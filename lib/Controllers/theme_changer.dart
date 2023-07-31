import 'package:flutter/material.dart';
import 'package:pantry_app/Controllers/dark_mode_controller.dart';
import 'package:pantry_app/dynamic_theme.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  DarkModeOption _darkModeOption;

  ThemeChanger(this._themeData, this._darkModeOption);

  getTheme() => _themeData;
  getDarkModeOption() => _darkModeOption;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  setDarkModeOption(DarkModeOption option) {
    _darkModeOption = option;
    switch (option) {
      case DarkModeOption.dark:
        setTheme(DynamicTheme.darkTheme);
        break;
      case DarkModeOption.light:
        setTheme(DynamicTheme.lightTheme);
        break;
      case DarkModeOption.system:
        setSystemTheme();
        break;
    }
  }

  setDarkMode() {
    _themeData = DynamicTheme.darkTheme;
    _darkModeOption = DarkModeOption.dark;
    notifyListeners();
  }

  setLightMode() {
    _themeData = DynamicTheme.lightTheme;
    _darkModeOption = DarkModeOption.light;
    notifyListeners();
  }

  toggleTheme() {
    if (_themeData.brightness == Brightness.dark) {
      setLightMode();
    } else {
      setDarkMode();
    }
  }

  setSystemTheme() {
    if (WidgetsBinding.instance?.window.platformBrightness == Brightness.dark) {
      _themeData = DynamicTheme.darkTheme;
    } else {
      _themeData = DynamicTheme.lightTheme;
    }
    _darkModeOption = DarkModeOption.system;
    notifyListeners();
  }
}
