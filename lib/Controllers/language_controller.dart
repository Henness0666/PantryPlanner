import 'package:flutter/foundation.dart';
import 'expandable_controller.dart';

enum LanguageOption {
  system,
  english,
  spanish,
  french,
  german,
  italian,
  portuguese,
  russian,
  arabic,
  hindi,
  japanese,
  korean,
  chineseSimplified,
  chineseTraditional,
}

class LanguageController extends ChangeNotifier
    implements ExpandableController {
  bool _isExpanded = false;
  LanguageOption _currentLanguageOption = LanguageOption.system;

  @override
  bool get isExpanded => _isExpanded;
  LanguageOption get currentLanguageOption => _currentLanguageOption;

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

  void setLanguageOption(LanguageOption option) {
    _currentLanguageOption = option;
    collapse();
    notifyListeners();
  }
}
