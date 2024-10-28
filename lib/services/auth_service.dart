import 'dart:async';
import 'package:ticket_track/models/user_model.dart';

class AuthService {
  Future<bool> authenticate(UserModel user) async {
    await Future.delayed(Duration(seconds: 1));
    return user.username == 'testuser' && user.password == 'testpassword';
  }
}