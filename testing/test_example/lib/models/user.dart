// When doing TDD we stub out the code first
// then write tests, then write code
class User {
  // Properties for name and email
  late final String name;
  late final String email;

  // Default Generative Constructor
  User({required String name, required String email});

  // Override toString to display 'Name: <name>, Email: <email>'
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
