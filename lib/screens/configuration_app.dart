import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/theme_notifier.dart';

class ConfigurationAppScreen extends StatelessWidget {
  const ConfigurationAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ThemeNotifier>(
          builder: (context, themeNotifier, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Modo Oscuro'),
                    Switch(
                      value: themeNotifier.isDarkMode,
                      onChanged: (bool value) {
                        themeNotifier.toggleTheme();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
