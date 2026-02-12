import 'package:sql_storage/models/dog.dart';

// flutter pub add sqflite
import 'package:sqflite/sqflite.dart';
// flutter pub add path
import 'package:path/path.dart';

class DogDbManager {
  // Because this needs to be a singleton, I will make the constructor private
  // That way it can only be called from here
  const DogDbManager._();

  // I can now create the singleton instance that can be publically accessed
  static const DogDbManager instance = DogDbManager._();

  // Set up the initial variables for the DB: file name, version, private reference to DB
  static const _dbName = 'dogs.db';
  static const _dbVersion = 1;
  static Database? _database;

  // a public getter for the database, that either opens a connection
  // or returns the open database if one has already been opened
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _connectToDB();
      return _database!;
    }
  }

  // Connects to the DB, opening it or creating it as needed
  Future<Database> _connectToDB() async {
    // get the local db file location
    final dbPath = await getDatabasesPath();

    // join the dbPath to the fileName (this is the same as '$dbPath/$_dbName')
    final path = join(dbPath, _dbName);

    // opens a connection to the DB, and creates it if needed
    final db = openDatabase(
      path,
      onCreate: (database, _) {
        database.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: _dbVersion,
    );
    return db;
  }

  // Closes the connection to the DB. It should be called in dispose of any widget
  // that opens the DB to prevent DB corruption and other issues caused by hanging open connections
  void closeDB() async {
    // Call our getter to retrieve/open the DB
    final db = await database;
    db.close();
  }

  // Get all existing dogs from DB
  Future<List<Dog>> getDogs() async {
    final db = await database;

    // This returns a List of Maps of String to Object? and we need a List of Dogs (our model class)
    // Queries for the dogs table
    final dogMaps = await db.query('dogs');

    // Option 1: For loop
    // List<Dog> output = [];
    // for (final dogMap in dogMaps) {
    //   output.add(Dog.fromMap(dogMap));
    // }
    // return output;

    // Option 2: List.generate
    // return List.generate(dogMaps.length, (i) => Dog.fromMap(dogMaps[i]));

    // Option 3: List comprehension
    return [for (final dogMap in dogMaps) Dog.fromMap(dogMap)];
  }

  // Add a dog to the DB
  Future<void> insertDog(Dog dog) async {
    final db = await database;
    // Takes in the table name, and a map of column names to values
    await db.insert(
      'dogs',
      dog.toMap(),
      // This determines what happens if we are trying to insert to an ID that is already there
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Delete a dog in the DB
  Future<void> deleteDog(int id) async {
    final db = await database;
    // Inserting like below is really bad because it opens you to SQL injection attacks
    // db.delete('dogs', where: 'id = $id');
    // Instead we sanitize the input using whereArgs. The list of whereArgs get put into the question marks
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }

  // TODO: Update a dog in the DB
}
