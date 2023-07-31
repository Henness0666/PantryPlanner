import 'package:flutter/foundation.dart';
import 'package:pantry_app/Controllers/theme_changer.dart';
import 'expandable_controller.dart';

enum DarkModeOption {
  system,
  dark,
  light,
}

class DarkModeController extends ChangeNotifier
    implements ExpandableController {
  final ThemeChanger _themeChanger;

  DarkModeController(this._themeChanger);

  static const Map<DarkModeOption, String> darkModeNames = {
    DarkModeOption.system: 'System Default',
    DarkModeOption.light: 'Disabled',
    DarkModeOption.dark: 'Enabled',
  };

  bool _isExpanded = false;
  DarkModeOption _currentDarkModeOption = DarkModeOption.system;

  @override
  bool get isExpanded => _isExpanded;
  DarkModeOption get currentDarkModeOption => _currentDarkModeOption;

  @override
  void collapse() {
    _isExpanded = false;
    notifyListeners();
  }

  @override
  void expand() {
    _isExpanded = true;
    notifyListeners();
  }

  void setDarkModeOption(DarkModeOption option) {
    _currentDarkModeOption = option;

    switch (_currentDarkModeOption) {
      case DarkModeOption.dark:
        _themeChanger.setDarkMode();
        break;
      case DarkModeOption.light:
        _themeChanger.setLightMode();
        break;
      default:
        break;
    }

    collapse();
    notifyListeners();
  }
}
