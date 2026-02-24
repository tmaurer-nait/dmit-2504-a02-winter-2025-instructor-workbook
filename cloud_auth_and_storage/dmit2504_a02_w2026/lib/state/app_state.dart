import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:dmit2504_a02_w2026/firebase_options.dart';

// I hide email auth provider to prevent import collisions
// between this and firebase ui auth
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

// By extending change notifier I can make this class listenable
// Other classes can then listen for changes to this one and respond to them
class AppState extends ChangeNotifier {
  // This class's job is to broadcast changes in
  // firebase to the rest of the app
  AppState() {
    init();
  }

  // Boolean that tracks whether or not a user is logged in
  var _loggedIn = false;
  bool get loggedIn => _loggedIn;

  // Initialize connection to firebase, and configure firebase auth settings
  Future<void> init() async {
    // Connect to firebase before starting the app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Configure ui auth provider to tell it to allow email auth
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);

    // TODO: Listen to firebase auth state changes

    // Whenever the firebase auth user state changes (user signs in or out)
    // We notify all listeners of that change
    FirebaseAuth.instance.userChanges().listen((user) {
      // If they logged out user is null
      if (user == null) {
        _loggedIn = false;
      } else {
        _loggedIn = true;
      }
      // Once we've updated our state variables notify any listeners
      // This function is built in to the ChangeNotifier class we extended
      notifyListeners();
    });
  }
}
