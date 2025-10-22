import 'package:shared_preferences/shared_preferences.dart';

final class SharedPrefsService {
  SharedPrefsService();
  final _prefs = SharedPreferencesAsync();

  //vars
  final _kTranslator = 'translator';
  final _kQari = 'qari';
  final _kLanguage = 'language';
  final _kAppOpenCount = 'appOpen';
  final _kSuraFontSize = 'size:suraFont';
  final _kTranslateFontSize = 'size:translateFont';
  final _kRated = 'rated';
  final _kShowDonateDate = 'showDonateDate';
  final _kDbVersion = 'dbVersion';

  Future<int> get qariId async => (await _prefs.getInt(_kQari)) ?? 1;

  ///set [null] for unselect qari
  Future<void> setQariId(int? id) async {
    if (id == null) {
      await _prefs.remove(_kQari);
    } else {
      await _prefs.setInt(_kQari, id);
    }
  }

  Future<int?> get translatorId => _prefs.getInt(_kTranslator);

  ///set [null] for unselect translator
  Future<void> setTranslatorId(int? id) async {
    if (id == null) {
      await _prefs.remove(_kTranslator);
    } else {
      await _prefs.setInt(_kTranslator, id);
    }
  }

  //language
  Future<String?> get appLanguageCode => _prefs.getString(_kLanguage);
  Future<void> setLanguage(String langCode) =>
      _prefs.setString(_kLanguage, langCode);

  //app open
  Future<int> get appOpenCount async =>
      (await _prefs.getInt(_kAppOpenCount)) ?? 0;
  Future<void> incrementAppOpenCount() async {
    final count = await appOpenCount;

    if (count >= 100) {
      await _prefs.setInt(_kAppOpenCount, 1);
    } else {
      await _prefs.setInt(_kAppOpenCount, count + 1);
    }
  }

  Future<bool> get isFirstOpenApp async => (await appOpenCount) == 0;

  //fonts size
  Future<double> get suraFontSize async =>
      (await _prefs.getDouble(_kSuraFontSize)) ?? 24;
  Future<double> get translateFontSize async =>
      (await _prefs.getDouble(_kTranslateFontSize)) ?? 18;

  Future<void> ratedUser() async => await _prefs.setBool(_kRated, true);
  Future<bool> get isRatedUser async =>
      (await _prefs.getBool(_kRated)) ?? false;

  Future<void> setSuraFontSize(double size) =>
      _prefs.setDouble(_kSuraFontSize, size);
  Future<void> setTranslateFontSize(double size) =>
      _prefs.setDouble(_kTranslateFontSize, size);

  Future<DateTime?> get showDonateDate async {
    final dateString = await _prefs.getString(_kShowDonateDate);
    if (dateString == null) return null;
    return DateTime.tryParse(dateString);
  }

  Future<void> setShowDonateDate(DateTime date) async {
    final dateString = date.toIso8601String();
    await _prefs.setString(_kShowDonateDate, dateString);
  }

  Future<int> dbVersion(String dbName) async {
    return await _prefs.getInt('$_kDbVersion:$dbName') ?? 1;
  }

  Future<void> setDbVersion(String dbName, int version) async {
    await _prefs.setInt('$_kDbVersion:$dbName', version);
  }
}
