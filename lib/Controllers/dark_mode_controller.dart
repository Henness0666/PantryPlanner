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
  DarkModeOption _currentDarkModeOption;

  DarkModeController(this._themeChanger, this._currentDarkModeOption);

  static const Map<DarkModeOption, String> darkModeNames = {
    DarkModeOption.system: 'System Default',
    DarkModeOption.light: 'Disabled',
    DarkModeOption.dark: 'Enabled',
  };

  bool _isExpanded = false;

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
    _themeChanger.setDarkModeOption(option);
    collapse();
    notifyListeners();
  }
}
