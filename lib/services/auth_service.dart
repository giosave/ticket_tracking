import 'dart:async';
import 'package:ticket_track/models/user_model.dart';

class AuthService {
  Future<UserModel?> authenticate(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));

    if (username == 'testuser' && password == 'testpassword') {
      return UserModel(
        username: username,
        fullName: 'Test User',
        userId: 12345,
        role: 'administrador',
        email: 'test@example.com',
      );
    }
    return null;
  }
}