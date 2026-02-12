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
      onCreate: (database, version) {
        database.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: _dbVersion,
    );
    return db;
  }
}
