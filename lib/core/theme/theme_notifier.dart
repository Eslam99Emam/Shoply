import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  changeMode({required bool isDark}) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
