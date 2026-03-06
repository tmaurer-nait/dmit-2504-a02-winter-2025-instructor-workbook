import 'package:flutter/material.dart';

import 'package:bloc_example/state/user_cubit.dart';
import 'package:bloc_example/models/user.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Name Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            // Bloc builder works similarly to listenable builder
            // in that it will call the builder function any time a new state is emitted
            // by the bloc/cubit stream
            // BlocBuilder needs the subtypes of the cubit it listens to and the state that is emitted
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return Text(
                  'Username: ${state.user.firstName} ${state.user.lastName}',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          // get the user cubit from the BlocProvider (using inherited widget syntax)
          final cubit = BlocProvider.of<UserCubit>(context);

          // Create the new user
          final newUser = User('Phineas', cubit.state.user.lastName);

          // emit a new user state by calling updateUser
          cubit.updateUser(newUser);
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
