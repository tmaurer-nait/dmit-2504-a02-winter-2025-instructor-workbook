import 'package:flutter/material.dart';
import 'package:inherited_notifier_example/state/user_notifier.dart';

import '../models/user.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = UserNotifier.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Last Name Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            ListenableBuilder(
              listenable: user,
              builder: (_, _) {
                return Text('User name: ${user.firstName} ${user.lastName}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user last name here
        onPressed: () {
          user.lastName = 'simpson';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
