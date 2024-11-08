import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_track/models/user_model.dart';

class AuthService {
  Future<UserModel?> authenticate(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));

    if (username == 'testuser' && password == 'testpassword') {
      await _saveCredentials(username, password);
      return UserModel(
        username: username,
        fullName: 'User Admin',
        userId: 1,
        role: 'administrador',
        email: 'test@example.com',
      );
    } else if (username == 'testuser2' && password == 'testpassword2') {
      await _saveCredentials(username, password);
      return UserModel(
        username: username,
        fullName: 'User General',
        userId: 2,
        role: 'usuario',
        email: 'test2@example.com',
      );
    }
    return null;
  }

  Future<void> _saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
  }
}