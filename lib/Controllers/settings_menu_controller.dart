import 'package:flutter/foundation.dart';

enum DarkModeOption {
  system,
  dark,
  light,
}

class SettingsMenuController extends ChangeNotifier {
  bool _isDarkModeExpanded = false;
  DarkModeOption _currentDarkModeOption = DarkModeOption.system;

  bool get isDarkModeExpanded => _isDarkModeExpanded;
  DarkModeOption get currentDarkModeOption => _currentDarkModeOption;

  void collapseDarkMode() {
    _isDarkModeExpanded = false;
    notifyListeners();
  }

  void expandDarkMode() {
    _isDarkModeExpanded = true;
    notifyListeners();
  }

  void setDarkModeOption(DarkModeOption option) {
    _currentDarkModeOption = option;
    collapseDarkMode();
    notifyListeners();
  }
}
