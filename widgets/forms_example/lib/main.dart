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

  String? _isPasswordValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password Cannot Be Empty';
    }
    return null;
  }

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
            validator: (value) => (value == null || value.trim().isEmpty)
                ? 'Username Cannot be Empty'
                : null,
            decoration: InputDecoration(label: Text('Username')),
          ),
          TextFormField(
            controller: _passwordController,
            validator: _isPasswordValid,
            // You should include the following on password fields
            // For user experience reasons
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(label: Text('Password')),
          ),
          TextFormField(
            controller: _password2Controller,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password Cannot Be Empty';
              }
              if (value != _passwordController.text) {
                return 'Passwords Do Not Match';
              }
              return null;
            },
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(label: Text('Confirm Your Password')),
          ),
          ElevatedButton(
            onPressed: () {
              // For validation we want to leverage the form.validate
              // because it calls the validators on every single input
              // To do so we need to access the form, there are two ways to do that
              // First: Form.of(context).validate() <- works if the sign up is a
              // child of the form itself

              // Secondly is to use the key <- works always
              if (_formKey.currentState!.validate()) {
                // Here is where you handle the submit of the form
                // Usually you would do some validation and then call an API
                // update a database or whatever productive thing you want to do

                // We are just going to show a toast
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Username: ${_usernameController.text}, '
                      'Password: ${_passwordController.text}, '
                      'Password 2: ${_password2Controller.text}',
                    ),
                  ),
                );

                // To reset the form, access it the same way
                _formKey.currentState!.reset();
              }
            },
            child: Text('Sign Up!'),
          ),
        ],
      ),
    );
  }
}
