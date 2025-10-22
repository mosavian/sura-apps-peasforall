import 'package:bloc/bloc.dart';

import '../../../../core/status/data_indexed_status.dart';
import '../../../../core/status/get_status.dart';
import '../../../../core/status/indexed_status.dart';
import '../../../domain/entity/qari_entity.dart';
import '../../../domain/entity/translator_entity.dart';
import '../../../domain/repo/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _repo;

  //vars
  final List<QariEntity> _qariList = [];
  final List<TranslatorEntity> _translators = [];

  SettingsCubit(this._repo) : super(const SettingsState()) {
    //load all data
    getAllQari();
    getTranslators();
    getAppLanguage();
    getSuraFontSize();
    getTranslateFontSize();
  }

  Future<void> getAppLanguage() async {
    final appLanguage = await _repo.appLanguage;
    emit(state._copyWith(appLanguage: appLanguage));
  }

  Future<void> setAppLanguage(String langCode) async {
    emit(state._copyWith(appLanguage: langCode));
    await _repo.setLanguage(langCode);
  }

  Future<void> getAllQari() async {
    //loading
    emit(state._copyWith(getQari: const LoGetStatus()));
    _qariList.clear();

    //GET
    final result = await _repo.getAllQari();
    if (isClosed) return;

    //success
    if (result.isOk) {
      _qariList.addAll(result.asOk.data);
      emit(state._copyWith(getQari: SuGetStatus(items: _qariList)));
    }

    //error
    if (result.isError) {
      emit(state._copyWith(getQari: ErGetStatus(result.asError.error)));
    }
  }

  Future<void> getTranslators() async {
    //loading
    emit(state._copyWith(getTranslators: const LoGetStatus()));
    _translators.clear();

    //GET
    final result = await _repo.getTranslators();
    if (isClosed) return;

    //success
    if (result.isOk) {
      _translators.addAll(result.asOk.data);
      emit(state._copyWith(getTranslators: SuGetStatus(items: _translators)));
    }

    //error
    if (result.isError) {
      emit(state._copyWith(getTranslators: ErGetStatus(result.asError.error)));
    }
  }

  Future<void> changeQari(int id, int indexOfListView) async {
    //loading
    emit(state._copyWith(changeQari: LoIndexedStatus(index: indexOfListView)));

    //PUT request
    final result = await _repo.changeQari(id);
    if (isClosed) return;

    //success
    if (result.isOk) {
      for (var qari in _qariList) {
        qari.isActive = qari.id == id;
      }

      emit(
        state._copyWith(
          changeQari: SuIndexedStatus(
            'changed successfully',
            index: indexOfListView,
          ),
          getQari: SuGetStatus(items: _qariList),
        ),
      );
    }

    //error
    if (result.isError) {
      emit(
        state._copyWith(
          changeQari: ErIndexedStatus(
            result.asError.error,
            index: indexOfListView,
          ),
        ),
      );
    }
  }

  Future<void> changeTranslator(int? id, int indexOfListView) async {
    //loading
    emit(
      state._copyWith(
        changeTranslator: LoDataIndexedStatus(index: indexOfListView),
      ),
    );

    //PUT
    final result = await _repo.changeTranslator(id);
    if (isClosed) return;

    //success
    if (result.isOk) {
      for (var translator in _translators) {
        translator.isActive = translator.id == id;
      }

      emit(
        state._copyWith(
          changeTranslator: SuDataIndexedStatus(id, index: indexOfListView),
          getTranslators: SuGetStatus(items: _translators),
        ),
      );
    }

    //error
    if (result.isError) {
      emit(
        state._copyWith(
          changeTranslator: ErDataIndexedStatus(
            result.asError.error,
            index: indexOfListView,
          ),
        ),
      );
    }
  }

  Future<void> getSuraFontSize() async {
    final fontSize = await _repo.suraFontSize;
    emit(state._copyWith(suraFontSize: fontSize));
  }

  Future<void> getTranslateFontSize() async {
    final fontSize = await _repo.translateFontSize;
    emit(state._copyWith(translateFontSize: fontSize));
  }

  Future<void> increaseSuraFontSize() async {
    if (state.suraFontSize >= 60) return;

    emit(state._copyWith(suraFontSize: state.suraFontSize + 1));
    await _repo.setSuraFontSize(state.suraFontSize);
  }

  Future<void> increaseTranslateFontSize() async {
    if (state.translateFontSize >= 52) return;

    emit(state._copyWith(translateFontSize: state.translateFontSize + 1));
    await _repo.setTranslateFontSize(state.translateFontSize);
  }

  Future<void> decreaseSuraFontSize() async {
    if (state.suraFontSize <= 18) return;

    emit(state._copyWith(suraFontSize: state.suraFontSize - 1));
    await _repo.setSuraFontSize(state.suraFontSize);
  }

  Future<void> decreaseTranslateFontSize() async {
    if (state.translateFontSize <= 12) return;

    emit(state._copyWith(translateFontSize: state.translateFontSize - 1));
    await _repo.setTranslateFontSize(state.translateFontSize);
  }
}
