// import your framework
import 'package:flutter_test/flutter_test.dart';

// import the code you are testing
import 'package:test_example/models/user.dart';

void main() {
  // This allows me to organize and label my tests
  group('User Model Tests', () {
    // A model that I will use for testing
    // it will get recreated every test
    late User user;

    // In regards to set up for tests I can run a function before all tests
    // in the group, and/or a function before each test (setupAll, setUp)

    // runs once before each test in this group
    setUp(() {
      user = User(name: 'Tom', email: 'tmaurer@nait.ca');
    });
  });
}
