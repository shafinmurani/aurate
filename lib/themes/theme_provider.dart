import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../export.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get themeData => _isDark ? darkTheme : lightTheme;

  Color mainColor = Color(0xFFAF826D);

  ThemeProvider() {
    _loadTheme();
  }

  _loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    bool? isDark = pref.getBool('isDark');
    if (isDark != null) {
      _isDark = isDark;
      notifyListeners();
    }
  }

  void toggleTheme() async {
    _isDark = !_isDark;
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isDark', _isDark);
    notifyListeners();
  }
}
