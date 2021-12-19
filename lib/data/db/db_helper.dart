import 'package:koperasi/data/db/user_profile_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._privateConstructor();

  static DbHelper instance = DbHelper._privateConstructor();

  final tables = [
    UserProfileDao.CREATE_TABLE
  ]; //
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await openDB();
    return _database;
  }

  Future<Database> openDB() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'enigma.db'),
        onCreate: (db, version) {
          tables.forEach((table) async {
            await db.execute(table).then((_) {
              print('$table create');
            }).catchError((err) {
              print('error: $err');
            });
          });
        }, version: 1);
  }

  Future<int?> insert(String table, Map<String, dynamic> data) async {
    try {
      Database? db = await instance.database;
      final result =
      db?.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
      return result;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<int?> update(String table, Map<String, dynamic> row,
      Map<String, dynamic>? rowId) async {
    try {
      Database? db = await instance.database;
      if (rowId != null) {
        final result = await db?.update(table, row,
            where: '${rowId.keys.first} = ?',
            whereArgs: [rowId[rowId.keys.first]]);
        return result;
      } else {
        final result = await db?.update(table, row);
        return result;
      }
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<int?> deleteAll(String table) async {
    try {
      Database? db = await instance.database;
      final result = await db?.delete(table);
      return result;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getData(String tableName,
      {String? orderBy}) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>>? result = [];
    if (orderBy != null) {
      result = await db?.query(tableName, orderBy: '$orderBy COLLATE NOCASE');
    } else {
      result = await db?.query(tableName);
    }
    return result;
  }

  Future<List<Map<String, dynamic>>?> getBy(
      String tableName, String where, Object whereArg) async {
    Database? db = await instance.database;
    final result =
    await db?.query(tableName, where: "$where LIKE '%$whereArg%'");
    return result;
  }

  Future<dynamic> getById(String tableName, Object id) async {
    Database? db = await instance.database;
    final result = await db?.query(tableName, where: 'id', whereArgs: [id]);
    if (result != null) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<bool?> batchInsert(List responseData, String tableName) async {
    Database? db = await instance.database;
    try {
      if (db != null) {
        await db.transaction((txn) async {
          var batch = txn.batch();
          for (final data in responseData) {
            batch.insert(tableName, data,
                conflictAlgorithm: ConflictAlgorithm.replace);
          }
          await batch.commit();
          return true;
        });
      } else {
        return false;
      }
    } catch (e) {
      print('error: $e');
      return false;
    }
  }
}
