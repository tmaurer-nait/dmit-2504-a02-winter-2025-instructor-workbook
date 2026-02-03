import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserSignupForm(),
        ),
      ),
    );
  }
}

// Extract the widget into its own form widget so we can make it stateful later
// plus it's cleaner code
class UserSignupForm extends StatelessWidget {
  const UserSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'New User Sign Up',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Text Form Field rather than TextField to allow connection to the form
          // widget and leverage the form validate/save/reset functionality
          TextFormField(decoration: InputDecoration(label: Text('Username'))),
          TextFormField(
            // You should include the following on password fields
            // For user experience reasons
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(label: Text('Password')),
          ),
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(label: Text('Confirm Your Password')),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Sign Up!')),
        ],
      ),
    );
  }
}
