import 'package:sqflite/sqflite.dart';

import '../models/base_model.dart';
import 'provider/database_provider.dart';

abstract class DbHelper<T extends BaseModel>{
  Future<Database> get db => DatabaseProvider.database;
  Future<List<T>> getList();
  Future<int> insert(T value);
  Future<int> delete(int id);
}