import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_track/providers/new_ticket_provider.dart';
import 'package:ticket_track/providers/ticket_provider.dart';
import 'package:ticket_track/providers/user_role_provider.dart';
import 'package:ticket_track/screens/login_screen.dart';
import 'package:ticket_track/widgets/home_screen_table.dart';

import 'models/counter.dart';
import 'models/screen_manager.dart';
import 'models/theme_notifier.dart';
import 'screens/configuration_app.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => ScreenManager()),
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => TicketProvider()),
        ChangeNotifierProvider(create: (context) => NewTicketProvider()),
        ChangeNotifierProvider(create: (context) => UserRoleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeNotifier.themeData,
          home: LoginScreen()
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getUserRole(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar el rol del usuario'));
        } else {
          final userRole = snapshot.data;
          final Map<String, Map<String, dynamic>> menuItems = _getMenuItems(userRole, context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
              actions: [
                PopupMenuButton<String>(
                  icon: const Icon(Icons.person),
                  onSelected: (String result) {
                    switch (result) {
                      case 'Configuración':
                        Provider.of<ScreenManager>(context, listen: false).changeScreen('Configuración');
                        break;
                      case 'Color Oscuro':
                        final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
                        if (themeNotifier != null) {
                          themeNotifier.toggleTheme();
                        } else {
                          print('Error');
                        }
                        break;
                      case 'Cerrar Sesión':
                        AuthService().clearCredentials();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Configuración',
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Configuración'),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Color Oscuro',
                      child: ListTile(
                        leading: Icon(Icons.brightness_6),
                        title: Text('Color Oscuro'),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Cerrar Sesión',
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Cerrar Sesión'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      'Menú',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ...menuItems.entries.map((entry) {
                    return ListTile(
                      leading: Icon(entry.value['icon']),
                      title: Text(entry.key),
                      onTap: entry.value['action'],
                    );
                  }).toList(),
                ],
              ),
            ),
            body: Consumer<ScreenManager>(
              builder: (context, screenManager, child) {
                if (screenManager.currentScreen == 'Inicio') {
                  return const HomeScreen();
                } else if (screenManager.currentScreen == 'Configuración') {
                  return const ConfigurationAppScreen();
                } else if (screenManager.currentScreen == 'Historial Tickets') {
                  return const HomeScreenTable();
                } else {
                  return const Center(child: Text('No se ha encontrado la pantalla'));
                }
              },
            ),
          );
        }
      },
    );
  }

  Future<String?> _getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userRole');
  }

  Map<String, Map<String, dynamic>> _getMenuItems(String? role, BuildContext context) {
    if (role == 'admin') {
      return {
        'Inicio': {
          'icon': Icons.home,
          'action': () {
            Provider.of<ScreenManager>(context, listen: false).changeScreen('Inicio');
            Navigator.pop(context);
          },
        },
        'Historial Tickets': {
          'icon': Icons.history,
          'action': () {
            Provider.of<ScreenManager>(context, listen: false).changeScreen('Historial Tickets');
            Navigator.pop(context);
          },
        },
        'Historial Tickets de Soporte': {
          'icon': Icons.history,
          'action': () {
            Provider.of<ScreenManager>(context, listen: false).changeScreen('Historial Tickets');
            Navigator.pop(context);
          },
        },
      };
    } else {
      return {
        'Inicio': {
          'icon': Icons.home,
          'action': () {
            Provider.of<ScreenManager>(context, listen: false).changeScreen('Inicio');
            Navigator.pop(context);
          },
        },
      };
    }
  }
}
