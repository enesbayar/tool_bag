import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tool_bag/models/to_do.dart';

class DbHelper {
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }

    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "todoList.db");
    var toDoListDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return toDoListDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "Create table todo(id integer primary key, description text, isDone bool)");
  }

  Future<List<ToDo>> getToDoList() async {
    Database db = await this.db;
    var result = await db.query("todo");
    return List.generate(result.length, (i) {
      return ToDo.fromObject(result[i]);
    });
  }

  Future<int> insert(ToDo todo) async {
    Database db = await this.db;
    var result = db.insert("todo", todo.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = db.rawDelete("delete from todo where id= $id");
    return result;
  }

  Future<int> update(ToDo todo) async {
    Database db = await this.db;
    var result =
        db.update("todo", todo.toMap(), where: "id=?", whereArgs: [todo.id]);
    return result;
  }
}
