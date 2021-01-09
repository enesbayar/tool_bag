import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tool_bag/models/hes_code.dart';

class DbHelperForHesCode{
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }

    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "hesCode.db");
    var hesCodeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return hesCodeDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "Create table tblHesCode(id integer primary key, hesCode text, name text, validityDate text)");
  }

  Future<List<HesCode>> getToDoList() async {
    Database db = await this.db;
    var result = await db.query("tblHesCode");
    return List.generate(result.length, (i) {
      return HesCode.fromObject(result[i]);
    });
  }

  Future<int> insert(HesCode hesCode) async {
    Database db = await this.db;
    var result = db.insert("tblHesCode", hesCode.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = db.rawDelete("delete from tblHesCode where id= $id");
    return result;
  }
}
