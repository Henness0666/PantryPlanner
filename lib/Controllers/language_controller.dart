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
  static const Map<LanguageOption, String> languageNames = {
    LanguageOption.system: 'System Default',
    LanguageOption.english: 'English',
    LanguageOption.spanish: 'Español',
    LanguageOption.french: 'Français',
    LanguageOption.german: 'Deutsch',
    LanguageOption.italian: 'Italiano',
    LanguageOption.portuguese: 'Português',
    LanguageOption.russian: 'Русский',
    LanguageOption.arabic: 'العربية',
    LanguageOption.hindi: 'हिन्दी',
    LanguageOption.japanese: '日本語',
    LanguageOption.korean: '한국어',
    LanguageOption.chineseSimplified: '简体中文',
    LanguageOption.chineseTraditional: '繁體中文',
  };
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
