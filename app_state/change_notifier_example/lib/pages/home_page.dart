import 'package:flutter/material.dart';

import 'first_name_page.dart';
import 'last_name_page.dart';

import '../models/user.dart';

class HomePage extends StatelessWidget {
  // Here we create our shared User app state variable
  // the colon syntax, allows for variable initialization before the constructor body
  HomePage({super.key}) : user = User('Joe', 'Doctor') {
    // Constructor body goes here
  }

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FirstNamePage(user: user),
                ),
              ),
              child: const Text('First Name Page'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LastNamePage()),
              ),
              child: const Text('Last Name Page'),
            ),
          ],
        ),
      ),
    );
  }
}
