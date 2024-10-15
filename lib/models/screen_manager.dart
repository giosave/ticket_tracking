import 'package:flutter/material.dart';

class ScreenManager with ChangeNotifier {
  String _currentScreen = 'Inicio';

  String get currentScreen => _currentScreen;

  void changeScreen(String screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}

