import 'dart:async';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'package:sura_apps_1_1/src/data/source/local/shared_prefs_service.dart';

import '../config_locator.dart';
import '../src/data/source/local/package_info_service.dart';

abstract class DbSource {
  DbSource(this._assetsPath, {bool upgradeWhenNewVersion = true})
    : _upgradeWhenNewVersion = upgradeWhenNewVersion {
    _init();
  }
  final String _assetsPath;
  final bool _upgradeWhenNewVersion;
  late final Database db;
  Completer<void>? initCompleter;

  Future<void> _init() async {
    initCompleter = Completer();
    await copyDatabase(
      _assetsPath,
      upgradeWhenNewVersion: _upgradeWhenNewVersion,
    );
    db = await openDatabase(_assetsPath);
    initCompleter!.complete();
  }

  ///copy Databse from assets to internal
  Future<void> copyDatabase(
    String assetsPath, {
    bool upgradeWhenNewVersion = true,
  }) async {
    final internalDir = await getDatabasesPath();
    final dbInternalPath = '$internalDir/$assetsPath';

    // Check if the database exists
    var exists = await databaseExists(dbInternalPath);

    if (exists && !upgradeWhenNewVersion) return;

    if (upgradeWhenNewVersion) {
      if (exists && !await _isNewAppVersion()) return;
    }

    try {
      await Directory(path.dirname(dbInternalPath)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(assetsPath);
    List<int> bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );

    // Write and flush the bytes written
    await File(dbInternalPath).writeAsBytes(bytes, flush: true);
  }

  ///چک کردن نسخه جدید اپ
  Future<bool> _isNewAppVersion() async {
    final newVersion = locator<PackageInfoService>().version;

    final prefs = SharedPreferencesAsync();
    final oldVersion = await prefs.getString("old_app_version");

    ///is exist new version
    if (newVersion != oldVersion) {
      //save new version
      await prefs.setString("old_app_version", newVersion);
    }

    return newVersion != oldVersion;
  }
}

abstract class DbSourceV2 {
  // Future<Database> openPrepopulatedDatabase(String assetPath) async {
  //   final dbPath = await getDatabasesPath();
  //   final dbName = assetPath.split('/').last;
  //   final path = join(dbPath, dbName);

  //   // اگر دیتابیس هنوز کپی نشده، از assets کپی کن
  //   if (!await File(path).exists()) {
  //     ByteData data = await rootBundle.load(assetPath);
  //     List<int> bytes = data.buffer.asUint8List();
  //     await File(path).writeAsBytes(bytes);
  //   }

  //   return await openDatabase(path);
  // }

  // Future<Database> openDatabaseFromAssets({
  //   required String assetPath,
  //   required String requiredTable, // مثلا: 'Quran'
  //   int version = 1,
  // }) async {
  //   final dbPath = await getDatabasesPath();
  //   final dbName = assetPath.split('/').last;
  //   final path = join(dbPath, dbName);

  //   Future<void> copyDatabase() async {
  //     ByteData data = await rootBundle.load(assetPath);
  //     List<int> bytes = data.buffer.asUint8List();
  //     await File(path).writeAsBytes(bytes, flush: true);
  //   }

  //   // اگر دیتابیس وجود ندارد → کپی اولیه
  //   if (!await File(path).exists()) {
  //     await copyDatabase();
  //   }

  //   // دیتابیس را باز می‌کنیم
  //   Database db = await openDatabase(
  //     path,
  //     version: version,
  //     onUpgrade: (db, oldVersion, newVersion) async {
  //       // اگر نسخه تغییر کرده بود → دیتابیس قدیمی جایگزین شود
  //       if (oldVersion < newVersion) {
  //         await db.close(); // خیلی مهم!
  //         await copyDatabase();
  //       }
  //     },
  //   );

  //   // تست سالم بودن دیتابیس (وجود جدول ضروری)
  //   try {
  //     final result = await db.rawQuery(
  //       "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
  //       [requiredTable],
  //     );

  //     if (result.isEmpty) {
  //       // جدول وجود ندارد → دیتابیس خراب یا اشتباه است
  //       throw Exception("Table $requiredTable not found");
  //     }
  //   } catch (e) {
  //     // دیتابیس خراب است → دوباره کپی می‌کنیم
  //     await db.close();
  //     await copyDatabase();
  //     db = await openDatabase(path, version: version);
  //   }

  //   return db;
  // }

  // Future<Database> openDatabaseFromAssets({
  //   required String assetZipPath, // مسیر فایل zip در assets
  //   required String dbFileName, // نام فایل دیتابیس داخل zip (مثلا 'quran.db')
  //   required String requiredTable, // جدول ضروری
  //   int version = 1,
  // }) async {
  //   // مسیر پایگاه داده در دستگاه
  //   final databasesPath = await getDatabasesPath();
  //   final dbPath = join(databasesPath, dbFileName);

  //   Future<void> extractDatabase() async {
  //     // 1️⃣ خواندن zip از assets
  //     final ByteData data = await rootBundle.load(assetZipPath);
  //     final Uint8List bytes = data.buffer.asUint8List();

  //     // 2️⃣ نوشتن zip موقت در temp
  //     final tempDir = await getTemporaryDirectory();
  //     final tempZipPath = join(
  //       tempDir.path,
  //       'temp_${DateTime.now().millisecondsSinceEpoch}.zip',
  //     );
  //     await File(tempZipPath).writeAsBytes(bytes, flush: true);

  //     // 3️⃣ استخراج zip به مسیر دیتابیس
  //     final archive = ZipDecoder().decodeBytes(bytes);
  //     for (final file in archive) {
  //       if (file.name == dbFileName) {
  //         final extractedBytes = file.content as List<int>;
  //         final outFile = File(dbPath);
  //         await outFile.writeAsBytes(extractedBytes, flush: true);
  //         break;
  //       }
  //     }

  //     // حذف فایل temp
  //     if (await File(tempZipPath).exists()) {
  //       await File(tempZipPath).delete();
  //     }
  //   }

  //   // اگر دیتابیس وجود ندارد → استخراج اولیه
  //   if (!await File(dbPath).exists()) {
  //     await extractDatabase();
  //   }

  //   //اگر نسخه تغییر کرده بود → دیتابیس قدیمی جایگزین شود
  //   final prefs = locator<SharedPrefsService>();
  //   if (version > (await prefs.dbVersion(dbFileName))) {
  //     await extractDatabase();
  //     await prefs.setDbVersion(dbFileName, version);
  //   }

  //   // باز کردن دیتابیس
  //   Database db = await openDatabase(dbPath);

  //   // بررسی سالم بودن دیتابیس
  //   // try {
  //   //   final result = await db.rawQuery(
  //   //     "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
  //   //     [requiredTable],
  //   //   );

  //   //   if (result.isEmpty) {
  //   //     // جدول وجود ندارد → دیتابیس خراب
  //   //     throw Exception("Table $requiredTable not found");
  //   //   }
  //   // } catch (e) {
  //   //   await db.close();
  //   //   await extractDatabase();
  //   //   db = await openDatabase(dbPath);
  //   // }

  //   return db;
  // }

  Future<Database> openDatabaseFromAssets({
    required String assetZipPath,
    required String dbFileName,
    required String requiredTable,
    int version = 1,
  }) async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(databasesPath, dbFileName);

    Future<void> extractDatabase() async {
      final data = await rootBundle.load(assetZipPath);
      final bytes = data.buffer.asUint8List();

      // مستقیماً استخراج از bytes (نیازی به tempZip نیست)
      final archive = ZipDecoder().decodeBytes(bytes);
      for (final file in archive) {
        if (file.name == dbFileName) {
          final extractedBytes = file.content as List<int>;
          final outFile = File(dbPath);
          await outFile.writeAsBytes(extractedBytes, flush: true);
          break;
        }
      }
    }

    final prefs = locator<SharedPrefsService>();
    final oldVersion = await prefs.dbVersion(dbFileName);

    // حالت اول: اصلاً وجود ندارد → بساز
    if (!await File(dbPath).exists()) {
      await extractDatabase();
      await prefs.setDbVersion(dbFileName, version);
    }
    // حالت دوم: نسخه جدید → آپدیت
    else if (version > oldVersion) {
      await extractDatabase();
      await prefs.setDbVersion(dbFileName, version);
    }

    // حالا دیتابیس را باز کن
    Database db = await openDatabase(dbPath);

    // چک سالم بودن دیتابیس
    // try {
    //   final result = await db.rawQuery(
    //     "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
    //     [requiredTable],
    //   );

    //   if (result.isEmpty) {
    //     // دیتابیس خراب → ری‌اکسترکت
    //     await db.close();
    //     await extractDatabase();
    //     db = await openDatabase(dbPath);
    //   }
    // } catch (e) {
    //   await db.close();
    //   await extractDatabase();
    //   db = await openDatabase(dbPath);
    // }

    return db;
  }
}

// abstract class DbSourceV2 {
//   // متد برای خواندن دیتابیس از assets
//   Future<Database> openDatabaseFromAssets({required String assetPath}) async {
//     // مسیر دایرکتوری دیتابیس را دریافت می‌کنیم
//     String databasesPath = await getDatabasesPath();
//     final String dbName = assetPath.split('/').last;
//     String path = join(databasesPath, dbName);

//     // چک می‌کنیم که آیا دیتابیس از قبل کپی شده یا نه
//     bool exists = await databaseExists(path);

//     if (!exists) {
//       log('کپی کردن دیتابیس از assets...');

//       try {
//         // دایرکتوری را ایجاد می‌کنیم
//         await Directory(dirname(path)).create(recursive: true);

//         // فایل را از assets می‌خوانیم
//         ByteData data = await rootBundle.load(assetPath);
//         List<int> bytes = data.buffer.asUint8List(
//           data.offsetInBytes,
//           data.lengthInBytes,
//         );

//         // فایل را در مسیر دیتابیس می‌نویسیم
//         await File(path).writeAsBytes(bytes, flush: true);

//         log('دیتابیس با موفقیت کپی شد');
//       } catch (e) {
//         log('خطا در کپی کردن دیتابیس: $e');
//         rethrow;
//       }
//     }

//     // دیتابیس را باز کرده و برمی‌گردانیم
//     return await openDatabase(path);
//   }
// }
