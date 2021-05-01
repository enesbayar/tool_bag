import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../models/hes_code.dart';
import 'db_helper.dart';

class DbHelperForHesCode extends DbHelper<HesCode> {
  String tableName = 'tblHesCode';

  Future<List<HesCode>> getList() async {
    Database db = await this.db;
    var result = await db.query(tableName);
    return List.generate(result.length, (i) {
      return HesCode.fromJson(result[i]);
    });
  }

  Future<int> insert(HesCode hesCode) async {
    Database db = await this.db;
    var result = db.insert(tableName, hesCode.toJson());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = db.rawDelete("delete from $tableName where id= $id");
    return result;
  }
}
