import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/theme_notifier.dart';

class ConfigurationAppScreen extends StatefulWidget {
  const ConfigurationAppScreen({super.key});

  @override
  _ConfigurationAppScreenState createState() => _ConfigurationAppScreenState();
}

class _ConfigurationAppScreenState extends State<ConfigurationAppScreen> {
  String _selectedColor = 'Azul';

  final Map<String, ColorScheme> _colorSchemes = {
    'Azul': ColorScheme.fromSeed(seedColor: Colors.blue),
    'Verde': ColorScheme.fromSeed(seedColor: Colors.green),
    'Rosa': ColorScheme.fromSeed(seedColor: Colors.pink),
    'Naranja': ColorScheme.fromSeed(seedColor: Colors.orange),
    'Modo Oscuro': ColorScheme.dark(),
    'Modo Claro': ColorScheme.light(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
        child: Consumer<ThemeNotifier>(
          builder: (context, themeNotifier, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Color de la aplicación:', style: TextStyle(fontSize: 16)),
                    DropdownButton<String>(
                      value: _selectedColor,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedColor = newValue;
                          });
                          themeNotifier.updateColorScheme(_colorSchemes[newValue]!);
                        }
                      },
                      items: <String>['Azul', 'Verde', 'Rosa', 'Naranja', 'Modo Oscuro', 'Modo Claro']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
