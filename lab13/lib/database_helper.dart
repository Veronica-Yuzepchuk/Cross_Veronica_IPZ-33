import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '/note.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _db;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await openDatabase(
      join(await getDatabasesPath(), 'notes_database.db'),
      onCreate: (db, version) => db.execute(
        'CREATE TABLE notes(id INTEGER PRIMARY KEY, text TEXT, created_at DATE)',
      ),
      version: 1,
    );
    return _db!;
  }

  Future<List<Note>> getNotes() async {
    final db = await database;
    final maps = await db.query('notes', orderBy: 'created_at DESC');
    return maps.map((map) => Note.fromMap(map)).toList();
  }

  Future<void> insertNote(Note note) async {
    final db = await database;
    await db.insert('notes', note.toMap());
  }

  Future<void> deleteNote(int id) async {
    final db = await database;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}