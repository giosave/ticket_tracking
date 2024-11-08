import 'dart:async';
import 'package:ticket_track/models/user_model.dart';

class AuthService {
  Future<UserModel?> authenticate(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));

    if (username == 'testuser' && password == 'testpassword') {
      return UserModel(
        username: username,
        fullName: 'User Admin',
        userId: 1,
        role: 'administrador',
        email: 'test@example.com',
      );
    } else if (username == 'testuser2' && password == 'testpassword2') {
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
}