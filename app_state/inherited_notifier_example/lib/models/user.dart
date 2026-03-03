import 'package:flutter/material.dart';

// By extending change notifier, any other class can listen to the changes
class User extends ChangeNotifier {
  User(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  String? _firstName;
  String? _lastName;

  String? get firstName => _firstName;
  String? get lastName => _lastName;

  set firstName(newFirstName) {
    _firstName = newFirstName;
    // Whenever the name changes, notify any potential listeners
    // so that they can respond accordingly
    notifyListeners(); // this function comes from the ChangeNotifier super class
  }

  set lastName(newLastName) {
    _lastName = newLastName;
    // Whenever the name changes, notify any potential listeners
    // so that they can respond accordingly
    notifyListeners();
  }
}
