class User {
  User(String firstName, String lastName) {
    _firstName = firstName;
    _lastName = lastName;
  }

  late final String _firstName;
  late final String _lastName;

  String get firstName => _firstName;
  String get lastName => _lastName;

  // Remove setters for immutability
  // I don't want users to change the state without using Bloc
  // Otherwise they could bypass logging, make testing weird, etc.
}
