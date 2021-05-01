import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../models/to_do.dart';
import 'db_helper.dart';

class DbHelperForTODO extends DbHelper<ToDo> {
  String tableName = 'tblTodo';

  Future<List<ToDo>> getList() async {
    Database db = await this.db;
    var result = await db.query(tableName);
    return List.generate(result.length, (i) {
      return ToDo.fromObject(result[i]);
    });
  }

  Future<int> insert(ToDo todo) async {
    Database db = await this.db;
    var result = db.insert(tableName, todo.toJson());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = db.rawDelete("delete from $tableName where id= $id");
    return result;
  }

  Future<int> update(ToDo todo) async {
    Database db = await this.db;
    var result = db
        .update(tableName, todo.toJson(), where: "id=?", whereArgs: [todo.id]);
    return result;
  }
}
