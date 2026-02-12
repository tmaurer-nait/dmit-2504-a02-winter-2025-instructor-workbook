import 'package:flutter/material.dart';
import 'package:sql_storage/models/dog.dart';

// Needed for randomness
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Stateful var to track currently visible dogs
  List<Dog> dogs = [
    // TODO: Replace this with dogs from the DB
    Dog(id: 1, name: 'Pluto', age: 95),
    Dog(id: 2, name: 'Jake', age: 35),
    Dog(id: 3, name: 'Macy', age: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          // ItemBuilder and SeparatorBuilder are builder functions that take in
          // a context and return a widget. They also take in an index
          itemBuilder: (context, index) {
            // First get the corresponding dog for the index
            final dog = dogs[index];
            // Then return a list tile for that dog
            return ListTile(title: Text('${dog.name} - ${dog.age}'));
          },
          // If parameters are not needed in the function body, but required for function signature
          // matching, you can use underscores for them. These signify "ignorable" parameters
          separatorBuilder: (_, _) => Divider(),
          // The item and separator builder are called once per index in itemCount
          itemCount: dogs.length,
        ),
      ),
    );
  }
}
