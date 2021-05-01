import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database db;

  static Future<Database> get database async {
    if (db == null) {
      db = await DatabaseProvider.initializeDb(dbName: 'toolbag.db');
    }

    return db;
  }

  static Future<Database> initializeDb<T>({
    @required String dbName,
    int version: 1,
  }) async {
    String dbPath = join(await getDatabasesPath(), dbName);
    var db = await openDatabase(dbPath, version: version, onCreate: createDb);
    return db;
  }

  static void createDb(Database db, int version) async {
    await db.execute(
        'Create table tblTodo(id integer primary key, description text, isDone integer)');
    await db.execute(
        'Create table tblHesCode(id integer primary key, hesCode text, name text, validityDate text)');
  }
}
