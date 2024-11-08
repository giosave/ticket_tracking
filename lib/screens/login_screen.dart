import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_track/main.dart';
import 'package:ticket_track/providers/user_role_provider.dart';
import 'package:ticket_track/services/auth_service.dart';
import 'package:ticket_track/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_track/services/services_response.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _isLoading = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? password = prefs.getString('password');

    if (username != null && password != null) {
      _userController.text = username;
      _passwordController.text = password;
      await _login();
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _login() async {
    if (_userController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, complete todos los campos')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    ServicesResponse<UserModel> response = await _authService.accessTicketTracking(
      _userController.text,
      _passwordController.text,
    );

    UserModel? user = response.isSuccess ? response.data : null;

    setState(() {
      _isLoading = false;
    });

    if (user != null && mounted) {
      Provider.of<UserRoleProvider>(context, listen: false).setUser(user);
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: user.fullName)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciales incorrectas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 223, 223, 223),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'lib/images/logotipoow.png',
                      height: 200,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Text('Error al cargar la imagen');
                      },
                    ),
                    TextField(
                      controller: _userController,
                      decoration: const InputDecoration(
                        labelText: 'Usuario',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      child: const Text('Iniciar Sesión'),
                    ),
                  ],
                ),
              ),
            ),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
