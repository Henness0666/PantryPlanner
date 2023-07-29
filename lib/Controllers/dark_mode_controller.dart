import 'package:flutter/foundation.dart';
import 'expandable_controller.dart';

enum DarkModeOption {
  system,
  dark,
  light,
}

class DarkModeController extends ChangeNotifier
    implements ExpandableController {
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
    collapse();
    notifyListeners();
  }
}
