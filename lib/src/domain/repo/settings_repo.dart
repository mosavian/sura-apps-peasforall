import '../../../core/result.dart';
import '../entity/qari_entity.dart';
import '../entity/translator_entity.dart';

abstract interface class SettingsRepo {
  const SettingsRepo();

  //set initil translator
  Future<Result<void>> setInitilTranslator();

  //translator
  Future<Result<List<TranslatorEntity>>> getTranslators();

  ///set [null] for remove translate
  Future<Result<String>> changeTranslator(int? id);

  //qari
  Future<Result<List<QariEntity>>> getAllQari();
  Future<Result<void>> changeQari(int id);

  //language
  Future<String> get appLanguage;
  Future<void> setLanguage(String langCode);

  //fonts size
  Future<double> get suraFontSize;
  Future<double> get translateFontSize;
  Future<void> setSuraFontSize(double size);
  Future<void> setTranslateFontSize(double size);

  Future<bool> isShowDonateDate();
}
