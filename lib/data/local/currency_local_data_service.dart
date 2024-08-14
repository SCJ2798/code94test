import 'package:ilabtest/data/local/base_db_service.dart';
import 'package:ilabtest/model/currency_model.dart';
import 'package:sqflite/sqflite.dart';

class CurrencyLocalDataService extends BaseDbService<CurrencyModel> {
  final String tableName = 'currencies';

  @override
  Future<void> addData(CurrencyModel data) async {
    Database db = await init();
    await db.insert(tableName, data.toJson());
    await db.close();
  }

  @override
  Future<List<CurrencyModel>> fetchAllData() async {
    Database db = await init();
    List<dynamic> results = await db.query(tableName);
    db.close();
    return results.map((e) => CurrencyModel.fromJson(e)).toList();
  }

  @override
  Future<List<CurrencyModel>> fetchRelatedData(query) async {
    Database db = await init();
    List<dynamic> results =
        await db.query(tableName, where: 'id=?', whereArgs: [query]);
    db.close();
    return results.map((e) => CurrencyModel.fromJson(e)).toList();
  }

  @override
  Future<void> updateData(CurrencyModel data) async {
    Database db = await init();
    await db.update(tableName, data.toJson(),
        where: 'code=?', whereArgs: [data.code]);
    db.close();
  }

  @override
  Future<void> deleteData(query) async {
    Database db = await init();
    await db.delete(tableName, where: 'code=?', whereArgs: [query]);
    await db.close();
  }
}
