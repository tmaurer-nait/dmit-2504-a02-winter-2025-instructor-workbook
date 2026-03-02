import 'package:flutter/material.dart';

import 'package:dmit2504_a02_w2026/firebase_options.dart';
import 'package:dmit2504_a02_w2026/models/todo.dart';

// I hide email auth provider to prevent import collisions
// between this and firebase ui auth
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  // Variable that tracks the currenlty logged in user
  User? _user;
  User? get user => _user;
  set user(User? user) {
    if (user == null) {
      throw ArgumentError('User cannot be set to null');
    }
    _user = user;
  }

  // Variable that tracks the current todos for the logged in user
  List<Todo>? _todos;
  List<Todo> get todos {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }
    return _todos!;
  }

  set todos(List<Todo> todos) {
    if (user == null) {
      throw StateError('Cannot set todos when user is null');
    }
    _todos = todos;
  }

  void _fetchTodos() {
    if (user == null) {
      throw StateError('Cannot fetch todos when user is null');
    }

    // First access firestore instance
    FirebaseFirestore.instance
        // Then get the docs from the collection
        .collection('/todos/${user!.uid}/todos')
        .get()
        // Then set the app state to match the backend
        .then((collectionSnapshot) {
          // convert the docs to Todo models
          todos = collectionSnapshot.docs
              .map((doc) => Todo.fromFirestore(doc))
              .toList();
        });
  }

  void updateTodo(Todo todo) {
    if (user == null) {
      throw StateError('Cannot update todos when user is null');
    }

    // Access firestore instance
    FirebaseFirestore.instance
        // Get the specific collection
        .collection('/todos/${user!.uid}/todos')
        // Get the single todo document
        .doc(todo.id)
        // Replace the values in that document
        .update(todo.toMap());
  }

  void deleteTodo(Todo todo) {
    if (user == null) {
      throw StateError('Cannot delete todos when user is null');
    }

    FirebaseFirestore.instance
        .collection('/todos/${user!.uid}/todos')
        .doc(todo.id)
        .delete()
        .then((_) {
          // After a successful delete, update the app state to keep in line
          todos.remove(todo);
          // In theory here is also where we'd notify any listeners
        });
  }

  // Initialize connection to firebase, and configure firebase auth settings
  Future<void> init() async {
    // Connect to firebase before starting the app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Configure ui auth provider to tell it to allow email auth
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);

    // Whenever the firebase auth user state changes (user signs in or out)
    // We notify all listeners of that change
    FirebaseAuth.instance.userChanges().listen((user) {
      // If they logged out user is null
      if (user == null) {
        _loggedIn = false;
      } else {
        _loggedIn = true;
        // Once they log in save the current user in app state
        this.user = user;
        // Then fetch their todos and store them in the app state
        _fetchTodos();
      }
      // Once we've updated our state variables notify any listeners
      // This function is built in to the ChangeNotifier class we extended
      notifyListeners();
    });
  }
}
