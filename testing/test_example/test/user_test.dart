// import your framework
import 'package:flutter_test/flutter_test.dart';

// import the code you are testing
import 'package:test_example/models/user.dart';

// flutter test <Path_to_test (test if ommitted)> (-r expanded)
// flutter test -r expanded

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
      // before each test we reset the user
      user = User(name: 'Tom', email: 'tmaurer@nait.ca');
    });

    // test has two params, description and callback function that is the test
    // generally we name tests with verbs like "should"
    test('User should have a readable name and email', () {
      // expect() assert that arg 1 == arg 2
      expect(user.name, 'Tom');
      expect(user.email, 'tmaurer@nait.ca');
    });

    test('User should override toString correctly', () {
      // Arrange - set up your test things
      final expected = 'Name: Tom, Email: tmaurer@nait.ca';

      // Act - do the thing you are testing
      final actual = user.toString();

      // Assert - validate the output
      expect(actual, expected);
    });
  });
}
