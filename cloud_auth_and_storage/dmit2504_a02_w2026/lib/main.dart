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
        '/sign-in': (context) => SignInScreen(
          // A list of actions we can bind to sign in functionality
          actions: [
            // The callback argument is called whenever the auth state changes
            AuthStateChangeAction((context, state) {
              // The auth state has changed, find out what happened and handle it
              // The following is shortand for variable assignment based
              // on the type of another variable
              final user = switch (state) {
                // User signed in to existing account
                SignedIn state => state.user,
                // User was just created
                UserCreated state => state.credential.user,
                // anything else
                _ => null,
              };

              // if user is null we do nothing
              if (user == null) return;

              // If user was just created update their username
              if (state is UserCreated) {
                // New user, we'll set the username to the first part
                // of their email
                user.updateDisplayName(user.email!.split('@').first);
              }

              // If the user was created or signed in to an existing user
              // navigate to the home page
              // Remove the sign in page from the stack
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ],
        ),
        // The profile screen from firebase ui auth
        '/profile': (context) => ProfileScreen(
          // Add an action handler here just like on the sign in screen
          actions: [
            // When there is a signout navigate to home
            SignedOutAction((context) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ],
        ),
      },
    );
  }
}
