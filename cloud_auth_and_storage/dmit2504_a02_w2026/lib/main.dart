import 'package:dmit2504_a02_w2026/state/app_state.dart';
import 'package:flutter/material.dart';

import 'package:dmit2504_a02_w2026/pages/home_page.dart';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';

void main() async {
  // Make sure our widget binding is ready to go
  WidgetsFlutterBinding.ensureInitialized();

  final applicationState = AppState();

  runApp(MainApp(applicationState: applicationState));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.applicationState, super.key});

  final AppState applicationState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(appState: applicationState),
        // The sign in screen from firebase ui auth
        '/sign-in': (context) => SignInScreen(),
        // The profile screen from firebase ui auth
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
