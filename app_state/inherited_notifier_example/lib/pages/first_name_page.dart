import 'package:flutter/material.dart';
import 'package:inherited_notifier_example/state/user_notifier.dart';

import '../models/user.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = UserNotifier.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('First Name Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            // The listenable builder calls the builder function whenever
            // the listenable changes, thereby redrawing the UI in response to State changes
            ListenableBuilder(
              listenable: user, // whenever the app state changes redraw
              builder: (context, child) {
                return Text('User Name: ${user.firstName} ${user.lastName}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user first name here
        onPressed: () {
          user.firstName = 'Bart';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
