import 'package:flutter/material.dart';

import 'pages/home_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/state/user_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap our material app in a bloc provider that will make the
    // user cubit accessible to the entire widget tree
    return BlocProvider(
      // Here we create the initial state (similarly to provider)
      create: (context) => UserCubit(),
      child: const MaterialApp(
        home: Scaffold(body: Center(child: HomePage())),
      ),
    );
  }
}
