import 'package:flutter/material.dart';
import 'package:nested_nav/pages/settings/option_1.dart';
import 'package:nested_nav/pages/settings/option_2.dart';
import 'package:nested_nav/pages/settings/option_3.dart';
import 'package:nested_nav/pages/settings/settings_home.dart';

// This widget's whole purpose is to contain the sub-navigator
// for all pages related to settings
class SettingsManager extends StatefulWidget {
  final String initialRoute;

  const SettingsManager({super.key, required this.initialRoute});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  // I will use this key to directly reference the sub-navigator (similarly to forms)
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Settings"),
        leading: IconButton(
          onPressed: () {
            // Here I will override the back button logic to utilize my sub-navigator
            if (_navigatorKey.currentState!.canPop()) {
              // If there is anything on my sub-navigator stack pop that
              _navigatorKey.currentState!.pop();
            } else {
              // Otherwise pop from the main navigator
              Navigator.of(context).pop();
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: widget.initialRoute,
        onGenerateRoute: (settings) {
          late Widget page;

          switch (settings.name) {
            case '/':
              page = SettingsHomePage();
              break;

            case '/option-1':
              page = Option1Page();
              break;

            case '/option-2':
              page = Option2Page();
              break;

            case '/option-3':
              page = Option3Page();
              break;
            default:
              throw Exception('Unknown Route: ${settings.name}');
          }

          return MaterialPageRoute(builder: (context) => page);
        },
      ),
    );
  }
}
