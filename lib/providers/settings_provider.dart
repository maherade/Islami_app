import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newMode) async {
    final pref = await SharedPreferences.getInstance();
    if (newMode == currentTheme) return;
    currentTheme = newMode;

    pref.setString("theme", currentTheme == ThemeMode.light ? "light" : "dark");
    notifyListeners();
  }

  String getMAinBackgroundImage() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/main_background.png'
        : 'assets/images/main_background_dark.png';
  }

  String languageCode = 'en';

  void changeLanguage(String lang) async {
    final pref = await SharedPreferences.getInstance();

    if (languageCode == lang) return;
    languageCode = lang;
    pref.setString("lang", languageCode);
    notifyListeners();
  }

  bool isDarkMood() {
    return currentTheme == ThemeMode.dark;
  }

  bool isEnglish() {
    return languageCode == 'en';
  }
}
