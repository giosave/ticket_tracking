import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_track/providers/ticket_provider.dart';
import 'package:ticket_track/screens/new_ticket.dart';

import 'models/counter.dart';
import 'models/screen_manager.dart';
import 'models/theme_notifier.dart';
import 'screens/configuration_app.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => ScreenManager()),
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => TicketProvider()),
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
          theme: ThemeData.dark(),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              //Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
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
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Provider.of<ScreenManager>(context, listen: false).changeScreen('Inicio');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () {
                Provider.of<ScreenManager>(context, listen: false).changeScreen('Configuración');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Provider.of<ScreenManager>(context, listen: false).changeScreen('Configuración');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Consumer<ScreenManager>(
        builder: (context, screenManager, child) {
          if (screenManager.currentScreen == 'Inicio') {
            return const NewTicket();
            //return const HomeScreen();
          } else if (screenManager.currentScreen == 'Configuración') {
            return const ConfigurationAppScreen();
          } else {
            return const Center(child: Text('No se ha encontrado la pantalla'));
          }
        },
      ),
    );
  }
}