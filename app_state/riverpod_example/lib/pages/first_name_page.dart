import 'package:flutter/material.dart';

import 'package:riverpod_example/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// We replace StatelessWidget with ConsumerWidget to access our providers
class FirstNamePage extends ConsumerWidget {
  const FirstNamePage({super.key});

  @override
  // The build method now needs a new parameter (ref) which is a reference to our providers
  Widget build(BuildContext context, WidgetRef ref) {
    // When we call build, watch the ref for changes to the userProvider
    // This does lazy initialization - we initialize it the first time we call this build
    // after that ref.watch just looks at the value
    final user = ref.watch(userProvider);
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
          // we have a reference to user above, so we could use that
          // but for demo purposes here's how you access the ref one time
          final currentUserState = ref.read(userProvider);
          // Here's how I update the state
          ref.read(userProvider.notifier).state = User(
            'Micycle',
            currentUserState.lastName,
          );
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
