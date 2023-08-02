import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  Future<void> saveLocalePreference(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.toString());
  }

  Future<Locale> loadLocalePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final localeString = prefs.getString('locale');
    if (localeString != null) {
      return Locale(localeString.split('_')[0], localeString.split('_')[1]);
    } else {
      return const Locale('en', 'US');
    }
  }
}
