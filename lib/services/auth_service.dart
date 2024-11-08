import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_track/models/user_model.dart';
import 'package:ticket_track/services/services_response.dart';

class AuthService {
  final String baseUrl = 'http://localhost:8080/';

  Future<ServicesResponse<UserModel>> accessTicketTracking(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'UserName': username, 'Password': password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        await _saveCredentials(username, password);
        return ServicesResponse<UserModel>.fromJson(jsonResponse, (data) => UserModel.fromJson(data as Map<String, dynamic>));
      } else {
        return ServicesResponse<UserModel>(
          httpStatusCode: response.statusCode,
          isSuccess: false,
          message: 'Error: ${response.reasonPhrase}',
          data: null,
        );
      }
    } catch (e) {
      return ServicesResponse<UserModel>(
        httpStatusCode: 500,
        isSuccess: false,
        message: 'Excepción: $e',
        data: null,
      );
    }
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