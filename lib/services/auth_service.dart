import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_track/models/user_model.dart';
import 'package:ticket_track/services/services_response.dart';

class AuthService {
  final String baseUrl = 'http://localhost:8080/';

  Future<ServicesResponse<UserModel>> accessTicketTracking(String username, String password) async {
    try {
      if (username == 'admin' && password == 'admin') {
        final fakeResponse = {
          'HTTPStatusCode': 200,
          'IsSuccess': true,
          'Message': 'Inicio de sesión exitoso',
          'Data': {
            'UserId': 1,
            'UserName': 'admin',
            'FullName': 'Admin User',
            'Role': 'admin',
            'Email': 'admin@example.com'
          }
        };
        await _saveCredentials(username, password);
        await _saveUserRole((fakeResponse['Data']! as Map<String, dynamic>)['Role'] as String);
        return ServicesResponse<UserModel>.fromJson(fakeResponse, (data) => UserModel.fromJson(data as Map<String, dynamic>));
      }


      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'UserName': username, 'Password': password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        if (jsonResponse.containsKey('data')) {
          final userData = jsonResponse['data'] as Map<String, dynamic>;
          await _saveCredentials(username, password);
          //await _saveUserRole(jsonResponse);
          return ServicesResponse<UserModel>.fromJson(
            jsonResponse,
            (data) => UserModel.fromJson(userData),
          );
        } else {
          return ServicesResponse<UserModel>(
            httpStatusCode: response.statusCode,
            isSuccess: false,
            message: 'Error: Datos de usuario no encontrados en la respuesta',
            data: null,
          );
        }
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

  Future<void> _saveUserRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userRole', role);
  }

  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
  }
}