// flutter pub add flutter_riverpod
import 'package:flutter_riverpod/legacy.dart';

class User {
  User(String firstName, String lastName) {
    _firstName = firstName;
    _lastName = lastName;
  }

  late final String _firstName;
  late final String _lastName;

  String get firstName => _firstName;
  String get lastName => _lastName;

  // Again removing setters to make it immutable
  // It is generally good practice to make your state immutable
  // And emit new states instead of changing existing ones
}

// Here we create a user provider that will "provide" the user to our entire app
// riverpod has many different providers, Stateprovider is the simplest one that we can
// listen to changes on
final userProvider = StateProvider<User>(
  // When initialized call this function
  (ref) => User('Jimothy', 'Anderson'),
);
