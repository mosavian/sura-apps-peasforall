import 'package:sqflite/sqlite_api.dart';

import '../../../../core/assets.dart';
import '../../../../core/db_source.dart';

// final class PersonDbSource extends DbSource {
//   PersonDbSource() : super(Assets.personDataDb);
//   final _tblQari = 'qari';
//   final _tblTranslator = 'translator';

//   Future<List<Map<String, Object?>>> getAllQari() async {
//     await initCompleter?.future;

//     return db.query(
//       _tblQari,
//       columns: ['id', 'fa_name', 'ar_name', 'audio_translation'],
//     );
//   }

//   Future<List<Map<String, Object?>>> getTranslators() async {
//     await initCompleter?.future;
//     return db.query(
//       _tblTranslator,
//       //  columns: ['id', 'fa_name', 'ar_name']
//     );
//   }

//   Future<String?> getAudioNameById(int id) async {
//     await initCompleter?.future;

//     final data = await db.query(
//       _tblQari,
//       columns: ['audio'],
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     if (data.isEmpty) return null;
//     return data.first['audio'] as String;
//   }

//   Future<bool> existsQariById(int id) async {
//     await initCompleter?.future;

//     final data = await db.query(_tblQari, where: 'id = ?', whereArgs: [id]);
//     return data.isNotEmpty;
//   }

//   Future<bool> existsTranslatorById(int id) async {
//     await initCompleter?.future;

//     final data = await db.query(
//       _tblTranslator,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     return data.isNotEmpty;
//   }

//   Future<String?> getTranslatorTblNameById(int id) async {
//     await initCompleter?.future;

//     final data = await db.query(
//       _tblTranslator,
//       columns: ['tblName'],
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     if (data.isEmpty) return null;

//     return data.first['tblName'] as String;
//   }
// }

final class PersonDbSource extends DbSourceV2 {
  PersonDbSource();
  Database? _db;
  final _tblQari = 'qari';
  final _tblTranslator = 'translator';

  Future<Database> get _database async {
    if (_db != null) return _db!;

    _db = await openDatabaseFromAssets(
      assetZipPath: Assets.personDataZip,
      dbFileName: 'person.db',
      requiredTable: _tblQari,
      // requiredTable: _tblQari,
      // version: 2,
    );
    return _db!;
  }

  Future<List<Map<String, Object?>>> getAllQari() async {
    final db = await _database;

    return db.query(
      _tblQari,
      columns: ['id', 'fa_name', 'ar_name', 'audio_translation'],
    );
  }

  Future<List<Map<String, Object?>>> getTranslators() async {
    final db = await _database;
    return db.query(
      _tblTranslator,
      //  columns: ['id', 'fa_name', 'ar_name']
    );
  }

  Future<String?> getAudioNameById(int id) async {
    final db = await _database;

    final data = await db.query(
      _tblQari,
      columns: ['audio'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (data.isEmpty) return null;
    return data.first['audio'] as String;
  }

  Future<bool> existsQariById(int id) async {
    final db = await _database;

    final data = await db.query(_tblQari, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty;
  }

  Future<bool> existsTranslatorById(int id) async {
    final db = await _database;

    final data = await db.query(
      _tblTranslator,
      where: 'id = ?',
      whereArgs: [id],
    );
    return data.isNotEmpty;
  }

  Future<String?> getTranslatorTblNameById(int id) async {
    final db = await _database;

    final data = await db.query(
      _tblTranslator,
      columns: ['tblName'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (data.isEmpty) return null;

    return data.first['tblName'] as String;
  }
}
