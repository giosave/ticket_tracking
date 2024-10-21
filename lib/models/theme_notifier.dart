import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;
  ColorScheme _colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

  ThemeData get themeData => ThemeData(
        colorScheme: _colorScheme.copyWith(
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
        ),
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      );

  Color get currentColor => _colorScheme.primary;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void updateColorScheme(ColorScheme colorScheme) {
    _colorScheme = colorScheme;
    notifyListeners();
  }
}