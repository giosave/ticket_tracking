import 'package:flutter/material.dart';

class AlertProvider with ChangeNotifier {
  String _message = '';

  String get message => _message;

  void setMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}