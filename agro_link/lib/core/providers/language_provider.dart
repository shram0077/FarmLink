import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'selected_language';
  String _currentLanguage = 'en'; // Track language as string instead of Locale

  String get currentLanguage => _currentLanguage;
  Locale get currentLocale => Locale(_currentLanguage);

  bool get isRtl => _currentLanguage == 'ku' || _currentLanguage == 'ar';

  LanguageProvider() {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(_languageKey) ?? 'en';
    _currentLanguage = savedLanguage;
    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    if (_currentLanguage != languageCode) {
      _currentLanguage = languageCode;
      notifyListeners();

      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, languageCode);
    }
  }

  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      case 'ku':
        return 'کوردی سۆرانی';
      default:
        return 'English';
    }
  }
}
