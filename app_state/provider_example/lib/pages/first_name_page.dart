import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_example/models/user.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap the scaffold in a consumer to access our app state
    // The sub type tells it which part of our app state to consume
    // And what type the app state has
    return Consumer<User>(
      // Whenever the user changes, this builder function is called with the new user
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('First Name Page')),
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                Text('User name: ${user.firstName} ${user.lastName}'),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // Update our user firs name here
            onPressed: () {
              user.firstName = 'Maggie';
            },
            child: const Icon(Icons.update),
          ),
        );
      },
    );
  }
}
