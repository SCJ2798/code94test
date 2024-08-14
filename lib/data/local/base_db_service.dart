import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDbService<T> {
  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE currencies(id INTEGER PRIMARY KEY AUTOINCREMENT, code TEXT NOT NULL , value DOUBLE DEFAULT 0.0 NOT NULL)',
      );
    }, onUpgrade: (db, oldVersion, newVersion) {}, version: 1);
  }

  Future<void> addData(T data);
  Future<List<T>> fetchAllData();
  Future<List<T>> fetchRelatedData(dynamic query);
  Future<void> updateData(T data);
  Future<void> deleteData(dynamic query);
}
