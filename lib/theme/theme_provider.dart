import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark = false;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  ThemeMode getTheme() {
    if (isDark == true) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
