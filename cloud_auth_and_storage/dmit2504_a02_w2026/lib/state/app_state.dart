import 'package:flutter/material.dart';

// By extending change notifier I can make this class listenable
// Other classes can then listen for changes to this one and respond to them
class AppState extends ChangeNotifier {
  // This class's job is to broadcast changes in
  // firebase to the rest of the app
  AppState();

  // Boolean that tracks whether or not a user is logged in
  var _loggedIn = false;
  bool get loggedIn => _loggedIn;

  // TODO: Listen to firebase auth state changes

  // TODO: Notify any listeners when loggedin changes
}
