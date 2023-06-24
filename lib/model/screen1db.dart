import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Screen1db {

  
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT,
        password TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// username, password: name and password of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'screen1db.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createUser(String username, String? password) async {
    final db = await Screen1db.db();

    final data = {'username': username, 'password': password};
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all users (journals)
  static Future<List< Map<String, dynamic> > > getUsers() async {
    final db = await Screen1db.db();
    return db.query('users', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getUser(int id) async {
    final db = await Screen1db.db();
    return db.query('users', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateUser(
      int id, String username, String? password) async {
    final db = await Screen1db.db();

    final data = {
      'username': username,
      'password': password,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteUser(int id) async {
    final db = await Screen1db.db();
    try {
      await db.delete("users", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}