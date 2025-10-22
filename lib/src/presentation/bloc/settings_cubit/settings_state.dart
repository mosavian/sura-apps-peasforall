part of 'settings_cubit.dart';

class SettingsState {
  const SettingsState({
    this.getQari = const LoGetStatus(),
    this.getTranslators = const LoGetStatus(),
    this.changeQari = const InitIndexedStatus(),
    this.changeTranslator = const InitDataIndexedStatus(),
    this.appLanguage = 'fa',
    this.suraFontSize = 26,
    this.translateFontSize = 23,
  });

  //statuses
  final GetStatus<QariEntity> getQari;
  final GetStatus<TranslatorEntity> getTranslators;
  final IndexedStatus changeQari;
  final DataIndexedStatus<int?> changeTranslator;
  final String appLanguage;
  final double suraFontSize;
  final double translateFontSize;

  //copy with
  SettingsState _copyWith({
    GetStatus<QariEntity>? getQari,
    GetStatus<TranslatorEntity>? getTranslators,
    IndexedStatus? changeQari,
    DataIndexedStatus<int?>? changeTranslator,
    String? appLanguage,
    double? suraFontSize,
    double? translateFontSize,
  }) {
    return SettingsState(
      getQari: getQari ?? this.getQari,
      getTranslators: getTranslators ?? this.getTranslators,
      changeQari: changeQari ?? this.changeQari,
      changeTranslator: changeTranslator ?? this.changeTranslator,
      appLanguage: appLanguage ?? this.appLanguage,
      suraFontSize: suraFontSize ?? this.suraFontSize,
      translateFontSize: translateFontSize ?? this.translateFontSize,
    );
  }
}
