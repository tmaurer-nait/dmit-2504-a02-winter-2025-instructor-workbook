import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is the home page")),
      // A button that hovers in the bottom right at all times
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Route to settings
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
