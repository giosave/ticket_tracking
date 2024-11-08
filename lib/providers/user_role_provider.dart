import 'package:flutter/material.dart';
import 'package:ticket_track/models/user_model.dart';

class UserRoleProvider with ChangeNotifier {
  UserModel? _user;

  String get role => _user?.role ?? 'administrador';

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  bool get isAdmin => role == 'administrador';
}