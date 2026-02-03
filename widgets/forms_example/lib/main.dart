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
class UserSignupForm extends StatefulWidget {
  const UserSignupForm({super.key});

  @override
  State<UserSignupForm> createState() => _UserSignupFormState();
}

class _UserSignupFormState extends State<UserSignupForm> {
  // Create a global key taht uniquely identifies this form
  // It allows us to access it for validation/reset purposes

  // Note: this key is a GlobalKey<FormState> not GlobalKey<_UserSignupFormState>
  // Because it is the key for the form widget, not this widget
  final _formKey = GlobalKey<FormState>();

  // This allows us to access the form field values as needed
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'New User Sign Up',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Text Form Field rather than TextField to allow connection to the form
          // widget and leverage the form validate/save/reset functionality
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(label: Text('Username')),
          ),
          TextFormField(
            controller: _passwordController,
            // You should include the following on password fields
            // For user experience reasons
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(label: Text('Password')),
          ),
          TextFormField(
            controller: _password2Controller,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(label: Text('Confirm Your Password')),
          ),
          ElevatedButton(
            onPressed: () {
              // Here is where you handle the submit of the form
              // Usually you would do some validation and then call an API
              // update a database or whatever productive thing you want to do

              // We are just going to show a toast
              // TODO: Validate
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Username: ${_usernameController.text}, '
                    'Password: ${_passwordController.text}, '
                    'Password 2: ${_password2Controller.text}',
                  ),
                ),
              );
            },
            child: Text('Sign Up!'),
          ),
        ],
      ),
    );
  }
}
