// import our framework
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// flutter pub add "dev:integration_test:{sdk: flutter}"
import 'package:integration_test/integration_test.dart';

// Import the code we are testing
import 'package:test_example/main.dart';

void main() {
  // Connect to our integration test framework
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // After this the rest basically looks the same as our widget/interaction test

  group('end-to-end app tests', () {
    // First test ensures all the data is visible
    testWidgets('start app and ensure all text is visible', (tester) async {
      // unlike in widget tests, I'm now loading the whole app
      await tester.pumpWidget(MainApp());

      // verify text is visible
      expect(find.text('John'), findsOneWidget);
      expect(find.text('JCENA@gmail.com'), findsOneWidget);
      expect(find.text('Welcome to the Home Page'), findsOneWidget);
    });

    // Second test ensures that the toggle works
    testWidgets('Tap on button and verify that name and email toggle hidden', (
      tester,
    ) async {
      await tester.pumpWidget(MainApp());

      // verify text is visible to start
      expect(find.text('John'), findsOneWidget);
      expect(find.text('JCENA@gmail.com'), findsOneWidget);

      final button = find.byType(ElevatedButton);

      // taps on the button
      await tester.tap(button);

      await tester.pumpAndSettle();

      // Verify I've toggled it off
      expect(find.text('John'), findsNothing);
      expect(find.text('JCENA@gmail.com'), findsNothing);

      // Tap button again
      await tester.tap(button);

      await tester.pumpAndSettle();

      // Verify I've toggled it back on
      expect(find.text('John'), findsOneWidget);
      expect(find.text('JCENA@gmail.com'), findsOneWidget);
    });
  });
}
