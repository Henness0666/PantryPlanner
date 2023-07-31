import 'package:flutter/material.dart';
import 'package:pantry_app/dynamic_theme.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  isDark() => _themeData == DynamicTheme.darkTheme;

  toggleTheme() {
    if (_themeData == DynamicTheme.lightTheme) {
      _themeData = DynamicTheme.darkTheme;
    } else {
      _themeData = DynamicTheme.lightTheme;
    }
    notifyListeners(); // Notify all it's listeners about the change.
  }
}
