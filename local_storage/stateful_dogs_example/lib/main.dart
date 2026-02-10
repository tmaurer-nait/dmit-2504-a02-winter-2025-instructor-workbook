import 'package:flutter/material.dart';
import 'package:stateful_dogs_example/widgets/dog_image.dart';

// flutter pub add shared_preferences
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // This boolean tracks whether or not we are in dark mode
  // It should be kept in alignment with shared preferences
  var _isDarkMode = false;

  // Helper function to get the dark mode from shared preferences
  Future<bool> _readDarkModeFromSharedPrefs() async {
    // First I get the shared preferences instance
    final prefs = await SharedPreferences.getInstance();

    // Then I read the bool from it (making sure to be null safe)
    return prefs.getBool('darkMode') ?? false;
  }

  @override
  void initState() {
    super.initState();

    _readDarkModeFromSharedPrefs().then((value) {
      setState(() {
        _isDarkMode = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text('Dog Rating App')),
        body: Center(
          child: Column(
            children: [
              DogImage(),
              SwitchListTile(
                value: _isDarkMode,
                title: Text('Dark Mode'),
                onChanged: (value) async {
                  // Update the local state dark mode value
                  setState(() {
                    _isDarkMode = value;
                  });

                  // Update the shared prefs to stay in line with local state
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('darkMode', value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
