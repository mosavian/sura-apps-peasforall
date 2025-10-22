import '../../../core/entity.dart';
import '../../../core/my_exception.dart';
import '../../../core/result.dart';
import '../../domain/entity/qari_entity.dart';
import '../../domain/entity/translator_entity.dart';
import '../../domain/repo/settings_repo.dart';
import '../source/local/device_info_service.dart';
import '../source/local/person_db_source.dart';
import '../source/local/shared_prefs_service.dart';
import '../source/local/verse_db_source.dart';

final class SettingsRepoImpl implements SettingsRepo {
  const SettingsRepoImpl(
    this._prefs,
    this._verseDb,
    this._personDb,
    this._deviceInfo,
  );
  final SharedPrefsService _prefs;
  final DeviceInfoService _deviceInfo;
  final PersonDbSource _personDb;
  final VerseDbSource _verseDb;

  @override
  Future<Result<List<QariEntity>>> getAllQari() async {
    try {
      //GET
      final res = await _personDb.getAllQari();
      final List<QariEntity> data = entityListFromJson<QariEntity>(
        res,
        QariEntity.fromJson,
      );

      //set active qari id
      final activeQariId = await _prefs.qariId;

      for (var qari in data) {
        if (qari.id == activeQariId) {
          qari.isActive = true;
          break;
        }
      }

      return Ok(data);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<Result<void>> changeQari(int id) async {
    try {
      //check is exists qari by id
      final existsQari = await _personDb.existsQariById(id);
      if (!existsQari) return Error('این قاری وجود ندارد');

      //change data is shared prefs
      await _prefs.setQariId(id);

      return Ok(null);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<Result<List<TranslatorEntity>>> getTranslators() async {
    try {
      //GET
      final res = await _personDb.getTranslators();
      final List<TranslatorEntity> translators =
          entityListFromJson<TranslatorEntity>(res, TranslatorEntity.fromJson);

      //check is exists translator
      for (var i = 0; i < translators.length; i++) {
        final existsTranslator = await _verseDb.isTableExists(
          translators[i].tblName,
        );
        if (!existsTranslator) {
          translators.removeAt(i);
        }
      }

      //check is active translator
      var activeTranslatorId = await _prefs.translatorId;
      if (activeTranslatorId != null) {
        for (var translator in translators) {
          if (translator.id == activeTranslatorId) {
            translator.isActive = true;
            break;
          }
        }
      }

      return Ok(translators);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<Result<String>> changeTranslator(int? id) async {
    try {
      if (id == null) {
        await _prefs.setTranslatorId(null);
        return Ok('ترجمه حذف شد');
      }

      //check is exists translator
      final existsTranslator = await _personDb.getTranslatorTblNameById(id);
      if (existsTranslator == null) {
        return Error('مترجم وجود ندارد');
      }

      //check is exists table in databse
      final existsTable = await _verseDb.isTableExists(existsTranslator);
      if (!existsTable) {
        return Error('مترجم وجود ندارد');
      }

      await _prefs.setTranslatorId(id);

      return Ok('ترجمه تغییر کرد');
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<String> get appLanguage async {
    final language = await _prefs.appLanguageCode;
    if (language != null) return language;

    //get phone language
    final deviceLanguage = _deviceInfo.deviceLanguageCode;
    final List<String> supportedLangs = ['fa', 'ar'];

    if (supportedLangs.contains(deviceLanguage)) return deviceLanguage;
    return 'fa';
  }

  @override
  Future<void> setLanguage(String langCode) => _prefs.setLanguage(langCode);

  @override
  Future<void> setSuraFontSize(double size) => _prefs.setSuraFontSize(size);

  @override
  Future<void> setTranslateFontSize(double size) =>
      _prefs.setTranslateFontSize(size);

  @override
  Future<double> get suraFontSize => _prefs.suraFontSize;

  @override
  Future<double> get translateFontSize => _prefs.translateFontSize;

  @override
  Future<Result<void>> setInitilTranslator() async {
    try {
      //get translators
      final translatorsData = await _personDb.getTranslators();
      final List<TranslatorEntity> translators =
          entityListFromJson<TranslatorEntity>(
            translatorsData,
            TranslatorEntity.fromJson,
          );

      for (var translator in translators) {
        //check is exists table in databse
        final existsTable = await _verseDb.isTableExists(translator.tblName);
        if (existsTable) {
          //save to shared prefs
          await _prefs.setTranslatorId(translator.id);
          break;
        }
      }

      return Ok(null);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<bool> isShowDonateDate() async {
    //اگر یوزر ایرانی نبود
    final isIranianUser = _deviceInfo.isIranianUser;
    if (!isIranianUser) return false;

    //دفعه سوم به بعد ورود کاربر نشون بده
    final appOpenCount = await _prefs.appOpenCount;
    if (appOpenCount < 3) return false;

    //چک کردن زمانی که آخرین بار حمایت مالی نمایش داده شده
    final showDonateDate = await _prefs.showDonateDate;
    if (showDonateDate == null) {
      //اگر تاریخ نمایش حمایت مالی وجود نداشت، یعنی اولین بار هست که نمایش داده میشه
      _prefs.setShowDonateDate(DateTime.now());
      return true;
    }

    //اگر از آخرین نمایش حمایت مالی بیشتر از 7 روز گذشته بود
    final now = DateTime.now();
    final duration = now.difference(showDonateDate);
    if (duration.inDays >= 7) {
      //بروزرسانی تاریخ آخرین نمایش حمایت مالی
      _prefs.setShowDonateDate(now);
      return true;
    }

    return false;
  }
}
