import 'package:flutter/material.dart';

import 'pages/home_page.dart';

import 'models/user.dart';

import 'package:provider/provider.dart';

void main() {
  // Wrap the main app in a provider which will "provide" access
  // to our User state object, for any consumers in the widget tree
  runApp(
    ChangeNotifierProvider(
      // This is where we create the state
      create: (context) => User('Cloud', 'Strife'),
      // The state is provided to the main app
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: HomePage())),
    );
  }
}
