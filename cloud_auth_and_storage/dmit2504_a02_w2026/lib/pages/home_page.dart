import 'package:dmit2504_a02_w2026/state/app_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.appState, super.key});

  // reference to the overall app state (with the loggedIn info)
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Listenable builder has 2 arguments
        // listenable -> the thing we listen to changes on
        // builder -> the build function we call when the listenable changes
        child: ListenableBuilder(
          listenable: appState,
          builder: (context, _) {
            // Check the application state and render the correct button as needed
            return appState.loggedIn
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/profile');
                    },
                    child: Text('Profile'),
                  )
                : ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-in');
                    },
                    child: Text('Sign In'),
                  );
          },
        ),
      ),
    );
  }
}
