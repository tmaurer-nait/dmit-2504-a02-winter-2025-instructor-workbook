import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'models/user.dart';
import 'state/user_notifier.dart';

void main() {
  runApp(const MainApp());
}

// This is the initialization of the app state I will provide
User user = User('Lisa', 'Simpson');

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap the material app with a user notifier to allow access to the user
    // from any widget in the Material App (all of them)
    return UserNotifier(
      user: user,
      child: MaterialApp(
        home: Scaffold(body: Center(child: HomePage())),
      ),
    );
  }
}
