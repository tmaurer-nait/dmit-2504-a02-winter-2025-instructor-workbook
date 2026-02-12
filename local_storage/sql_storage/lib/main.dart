import 'package:flutter/material.dart';
import 'package:sql_storage/models/dog.dart';
import 'package:sql_storage/managers/dog_db_manager.dart';

// Needed for randomness
import 'dart:math';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});
  final dogManager = DogDbManager.instance;
  // We need our own random generator
  final rng = Random();
  final randomNameChoices = ['Pluto', 'Jake', 'Macy', 'Rover', 'Buttercup'];

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Stateful var to track currently visible dogs
  List<Dog> dogs = [];
  int lastId = 0;

  void _loadDogs() async {
    try {
      // get all dogs from the db
      final dbDogs = await widget.dogManager.getDogs();

      // set state to show those dogs
      setState(() {
        dogs = dbDogs;
        lastId = dbDogs.isNotEmpty ? dbDogs.last.id : 0;
      });
    } catch (e) {
      print(e);
    }
  }

  // This function should generally not exist, instead you should have a real way of adding data
  // to the database. For example a form that accepts inputs. We're short on time though.
  void _createRandomTestData() async {
    try {
      for (var i = 0; i < 3; i++) {
        // Get a random name
        final randName =
            widget.randomNameChoices[widget.rng.nextInt(
              widget.randomNameChoices.length - 1,
            )];

        // Create a new dog with the next id and random age
        // NOTE: Because we are manually adding IDs instead of using Auto-generate in the SQL
        // We need to make sure we don't insert at the same id or we will replace the data
        final newDog = Dog(
          name: randName,
          age: widget.rng.nextInt(20),
          id: lastId + i + 1,
        );
        // Insert the dog
        await widget.dogManager.insertDog(newDog);
        // After a few refresh the data
      }
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _removeDog(int id) async {
    try {
      // This is using option 2 from our notes
      await widget.dogManager.deleteDog(id);
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // Call this a singular time to setup the DB
    // _createRandomTestData();
    _loadDogs();
  }

  @override
  void dispose() {
    super.dispose();
    widget.dogManager.closeDB();
  }

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
            return ListTile(
              title: Text('${dog.name} - ${dog.age}'),
              onTap: () {
                _removeDog(dog.id);
              },
            );
          },
          // If parameters are not needed in the function body, but required for function signature
          // matching, you can use underscores for them. These signify "ignorable" parameters
          separatorBuilder: (_, _) => Divider(),
          // The item and separator builder are called once per index in itemCount
          itemCount: dogs.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _createRandomTestData,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
