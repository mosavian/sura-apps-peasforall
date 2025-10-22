import 'package:sqflite/sqflite.dart';
import 'package:sura_apps_1_1/core/db_source.dart';

import '../../../../core/request/load_limit_request.dart';
import '../../../../flavors.dart';

// final class VerseDbSource extends DbSource {
//   VerseDbSource() : super('assets/flavor/${F.name}/quran.db');
//   final _verseTblName = 'Quran';

//   Future<List<Map<String, Object?>>> getVerses(LoadLimitReq req) async {
//     await initCompleter?.future;

//     return db.rawQuery(
//       "SELECT * FROM $_verseTblName LIMIT ${req.limit} OFFSET ${req.offset}",
//     );
//   }

//   Future<List<String>> getTranslate({
//     required String translator,
//     LoadLimitReq? loadLimitReq,
//   }) async {
//     await initCompleter?.future;

//     final limitQuery = loadLimitReq == null
//         ? null
//         : ' LIMIT ${loadLimitReq.limit} OFFSET ${loadLimitReq.offset}';

//     final data = await db.rawQuery(
//       'SELECT tr FROM $translator ${limitQuery ?? ''}'.trim(),
//     );

//     final List<String> translate = [];
//     for (var item in data) {
//       translate.add(item['tr'] as String);
//     }
//     return translate;
//   }

//   // Future<bool> isTranslatorExists(String translator) async {
//   //   await initCompleter?.future;

//   //   try {
//   //     final data = await db.rawQuery("SELECT * FROM $translator LIMIT 1");
//   //     return data.isNotEmpty;
//   //   } catch (e) {
//   //     return false;
//   //   }
//   // }

//   Future<bool> isTableExists(String tableName) async {
//     final result = await db.rawQuery(
//       "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
//       [tableName],
//     );
//     return result.isNotEmpty;
//   }

//   Future<int> suraChapter() async {
//     await initCompleter?.future;
//     final data = await db.query(_verseTblName, limit: 1, columns: ['Chapter']);
//     return data.first['Chapter'] as int;
//   }

//   Future<int> countVerses() async {
//     await initCompleter?.future;
//     final result = await db.rawQuery('SELECT COUNT(*) FROM $_verseTblName');
//     int count = Sqflite.firstIntValue(result) ?? 0;
//     return count;
//   }
// }

final class VerseDbSource extends DbSourceV2 {
  VerseDbSource();
  Database? _db;
  final _verseTblName = 'Quran';

  Future<Database> get _database async {
    if (_db != null) return _db!;

    _db = await openDatabaseFromAssets(
      assetZipPath: 'assets/flavor/${F.name}/quran.zip',
      dbFileName: 'quran.db',
      requiredTable: _verseTblName,
      version: 1,
      // requiredTable: _verseTblName,
      // version: 2,
    );
    return _db!;
  }

  Future<List<Map<String, Object?>>> getVerses(LoadLimitReq req) async {
    final db = await _database;

    return db.rawQuery(
      "SELECT * FROM $_verseTblName LIMIT ${req.limit} OFFSET ${req.offset}",
    );
  }

  Future<List<String>> getTranslate({
    required String translator,
    LoadLimitReq? loadLimitReq,
  }) async {
    final db = await _database;

    final limitQuery = loadLimitReq == null
        ? null
        : ' LIMIT ${loadLimitReq.limit} OFFSET ${loadLimitReq.offset}';

    final data = await db.rawQuery(
      'SELECT tr FROM $translator ${limitQuery ?? ''}'.trim(),
    );

    final List<String> translate = [];
    for (var item in data) {
      translate.add(item['tr'] as String);
    }
    return translate;
  }

  // Future<bool> isTranslatorExists(String translator) async {
  //   await initCompleter?.future;

  //   try {
  //     final data = await db.rawQuery("SELECT * FROM $translator LIMIT 1");
  //     return data.isNotEmpty;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<bool> isTableExists(String tableName) async {
    final db = await _database;

    final result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
      [tableName],
    );
    return result.isNotEmpty;
  }

  Future<int> suraChapter() async {
    final db = await _database;
    final data = await db.query(_verseTblName, limit: 1, columns: ['Chapter']);
    return data.first['Chapter'] as int;
  }

  Future<int> countVerses() async {
    final db = await _database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM $_verseTblName');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  }
}
