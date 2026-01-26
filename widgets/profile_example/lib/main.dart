import 'package:flutter/material.dart';
import 'package:profile_example/pages/profile_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
        cardColor: const Color.fromARGB(255, 200, 229, 233),
      ),
      fontFamily: 'BitCountProp',
    );
    final darkTheme = lightTheme.copyWith(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
    );

    return MaterialApp(
      home: ProfilePage(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
