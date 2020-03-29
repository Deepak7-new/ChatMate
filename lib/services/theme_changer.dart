import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger extends ChangeNotifier {
  bool isDarkMode;
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    primaryColor: Colors.purpleAccent,
    accentColor: Colors.blueAccent,
    backgroundColor: Colors.deepPurple,
  );

  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  static const int _blackPrimaryValue = 0xFF424242;

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: primaryBlack,
    accentColor: Colors.blueAccent,
    backgroundColor: Colors.black,
  );

  ThemeData getTheme() {
    if (isDarkMode) return darkTheme;
    return lightTheme;
  }

  fetchThemeType() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'isDarkMode';
    if (prefs.getBool(key) ?? false) {
      isDarkMode = true;
    } else{
      isDarkMode = false;
    }
    notifyListeners();
  }

  setTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'isDarkMode';
    final value = isDark;
    isDarkMode = isDark;
    prefs.setBool(key, value);
    notifyListeners();
  }
}
