import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note_model.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';


class DatabaseHelper {
  static const _databaseName = "MyNotes.db";
  static const _databaseVersion = 1;
  static const table = 'notes';


  DatabaseHelper._privateConstructor();  // <---------- Make this a singleton class
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // <---------- Only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Future<String> getDatabasePath() async {
  //   if (Platform.isWindows || Platform.isLinux) {
  //     final directory = await getApplicationSupportDirectory();
  //     return '${directory.path}/your_database.db';
  //   } else {
  //     return await getDatabasesPath(); // For Android/iOS
  //   }
  // }



  // <---------- Open the database and create it if it doesn't exist
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }



  // <---------- SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            created_at TEXT NOT NULL
          )
          ''');
  }



  // Now CRUD Operations

  // <---------- Create
  Future<int> createNote(Note note) async {
    Database db = await instance.database;
    return await db.insert(table, note.toMap());
  }

  // <---------- Read all notes
  Future<List<Note>> getAllNotes() async {
    Database db = await instance.database;
    final maps = await db.query(table, orderBy: 'created_at DESC');

    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  // <---------- Update
  Future<int> updateNote(Note note) async {
    Database db = await instance.database;
    return await db.update(table, note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  // <---------- Delete
  Future<int> deleteNote(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}