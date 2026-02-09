import 'package:flutter/material.dart';

class SettingsHomePage extends StatelessWidget {
  const SettingsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/option-1');
              },
              child: Text('Go To Option 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/option-2');
              },
              child: Text('Go To Option 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/option-3');
              },
              child: Text('Go To Option 3'),
            ),
          ],
        ),
      ),
    );
  }
}
