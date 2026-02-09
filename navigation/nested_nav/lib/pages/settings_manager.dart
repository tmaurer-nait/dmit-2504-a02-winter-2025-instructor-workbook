import 'package:flutter/material.dart';

// This widget's whole purpose is to contain the sub-navigator
// for all pages related to settings
class SettingsManager extends StatefulWidget {
  const SettingsManager({super.key});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          late Widget page;

          switch (settings.name) {
            case '/home':
              // TODO: Route to Settings Home
              break;

            case '/option-1':
              // TODO: Route to Option 1
              break;

            case '/option-2':
              // TODO: Route to Option 2
              break;

            case '/option-3':
              // TODO: Route to Option 3
              break;
            default:
          }

          return MaterialPageRoute(builder: (context) => page);
        },
      ),
    );
  }
}
