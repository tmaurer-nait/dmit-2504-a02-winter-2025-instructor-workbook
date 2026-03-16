// Testing framework imports
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import code we want to test
import 'package:test_example/models/user.dart';
import 'package:test_example/widgets/user_widget.dart';

void main() {
  group('User Widget Tests', () {
    late User user;
    late Widget app;

    // In my set up I will render the single widget I am testing into an empty
    // material app with an empty scaffold
    setUp(() {
      user = User(name: 'Beelzebub', email: 'beezyboy@gmail.com');

      // This app will be rendered headless and isolates the widget I want to test
      app = MaterialApp(
        home: Scaffold(body: UserWidget(user: user)),
      );
    });

    // instead of using test() we use testWidgets(). This allows access to a tester object
    // The tester is a reference to the headless environment with many testing features
    // The callback is also async now so we can wait for renders, setStates, interactions etc.
    testWidgets('UserWidget should display name and email on initial render', (
      tester,
    ) async {
      // Arrange
      // pumpWidget, renders the given widget for one frame
      await tester.pumpWidget(app);

      // Act
      // In UI testing you often use finders and matchers. Finders look for things in the UI
      // You should try to find widgets the same way that your users will
      final nameFinder = find.text('Beelzebub');
      final emailFinder = find.text('beezyboy@gmail.com');
      final buttonFinder = find.byType(ElevatedButton);

      // Assert
      // Our expects can now use matchers with the finders to check for a specific
      // number of matching widgets.
      // There are many different matchers (findsOne, findsAny, findsN, findsNothing)
      expect(nameFinder, findsOneWidget);
      expect(emailFinder, findsOneWidget);
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('User Widget should toggle info when button is pressed', (
      tester,
    ) async {
      await tester.pumpWidget(app);

      final nameFinder = find.text('Beelzebub');
      final emailFinder = find.text('beezyboy@gmail.com');
      final buttonFinder = find.byType(ElevatedButton);

      expect(nameFinder, findsOneWidget);
      expect(emailFinder, findsOneWidget);
      expect(buttonFinder, findsOneWidget);
      // ^ Ensure that we can see everything at the start

      // Tester can also be used to interact with widgets (emulate gestures)
      await tester.tap(buttonFinder);

      // Once I tap I need to wait for the handling, setState, rerenders etc.
      // I can do this with one of two options
      // await tester.pump(Duration(seconds: 1)); // render frames for 1 second
      await tester.pumpAndSettle(); // renders frames until none are scheduled

      // Make sure that the text is now hidden
      expect(nameFinder, findsNothing);
      expect(emailFinder, findsNothing);

      // Toggle it back on
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      expect(nameFinder, findsOneWidget);
      expect(emailFinder, findsOneWidget);
    });
  });
}
