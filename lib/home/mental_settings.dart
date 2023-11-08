import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mental_theme_notifier.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: DarkBlue,
      ),
      body: Container(
        child: Column(
          children: [
            Consumer<ThemeNotifier>(
              builder: (context, themeNotifier, _) {
                final _isDarkTheme =
                    themeNotifier.getTheme().brightness == Brightness.dark;

                void _toggleTheme(bool value) async {
                  await themeNotifier.setTheme(value);
                }

                return ListTile(
                  title: Text('Dark Theme'),
                  trailing: Switch(
                    value: _isDarkTheme,
                    onChanged: _toggleTheme,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
