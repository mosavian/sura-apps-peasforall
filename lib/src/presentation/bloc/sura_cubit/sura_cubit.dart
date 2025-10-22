import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/constants.dart';
import '../../../../core/request/load_limit_request.dart';
import '../../../../core/status/data_status.dart';
import '../../../../core/status/download_status.dart';
import '../../../../core/status/get_limit_status.dart';
import '../../../domain/entity/verse_entity.dart';
import '../../../domain/repo/sura_repo.dart';

part 'sura_state.dart';

class SuraCubit extends Cubit<SuraState> {
  final SuraRepo _repo;

  //vars
  final ItemScrollController scrollController = ItemScrollController();
  final List<VerseEntity> _verses = [];
  bool _complatedVerses = false;
  bool _canGetVersesRequest = true;
  Timer? _verseLimitTimer;
  StreamSubscription? _playerStreamSubscription;
  int? _versesCount;

  SuraCubit(this._repo) : super(SuraState()) {
    //load data
    getVerses();
    checkIsDownloadedAudio();

    //on player audio states
    _playerStreamSubscription = _repo.onAudoPlayerState().listen(
      _onPlayerState,
    );
  }

  Future<void> getVerses({int? offset}) async {
    if (!_canGetVersesRequest) return;
    _canGetVersesRequest = false;

    final req = LoadLimitReq(offset: offset ?? _verses.length);

    //loading
    if (req.offset == 0) {
      emit(state._copyWith(getVerses: const LoGetLimitStatus()));
      _complatedVerses = false;
      _verses.clear();
    }

    _verseLimitTimer = Timer(Duration(milliseconds: 500), () {
      _canGetVersesRequest = true;
    });

    //شمارش تعداد آیه ها
    if (req.offset == 0) {
      final countResult = await _repo.countOfVerses();

      //success
      if (countResult.isOk) {
        _versesCount = countResult.asOk.data;
      }

      //error
      if (countResult.isError) {
        emit(
          state._copyWith(
            getVerses: ErGetLimitStatus(countResult.asError.error),
          ),
        );
        return;
      }
    }

    //GET
    final result = await _repo.getVerses(req);
    if (isClosed) return;

    //success
    if (result.isOk) {
      final data = result.asOk.data;
      _verses.addAll(data);
      _complatedVerses = data.length < req.limit;
      emit(
        state._copyWith(getVerses: SuGetLimitStatus(_verses, _complatedVerses)),
      );
    }

    //error
    if (result.isError) {
      emit(state._copyWith(getVerses: ErGetLimitStatus(result.asError.error)));
    }
  }

  Future<void> checkIsDownloadedAudio() async {
    //loading
    emit(state._copyWith(downloadAudio: LoDownloadStatus()));

    //GET
    final result = await _repo.isDownloadedAudio();
    if (isClosed) return;

    //success
    if (result.isOk) {
      final isDownloaded = result.asOk.data;

      if (isDownloaded) {
        emit(state._copyWith(downloadAudio: SuDownloadStatus()));
      } else {
        emit(state._copyWith(downloadAudio: InitDownloadStatus()));
      }
    }

    //error
    if (result.isError) {
      emit(
        state._copyWith(downloadAudio: ErDownloadStatus(result.asError.error)),
      );
    }
  }

  Future<void> downloadAudio() async {
    //loading
    emit(state._copyWith(downloadAudio: const LoDownloadStatus()));

    //START DOWNLOAD
    final result = await _repo.downloadAudio((progress) {
      if (!isClosed) {
        emit(
          state._copyWith(downloadAudio: LoDownloadStatus(progress: progress)),
        );
      }
    });
    if (isClosed) return;

    //success
    if (result.isOk) {
      emit(
        state._copyWith(
          downloadAudio: SuDownloadStatus(message: result.asOk.data),
        ),
      );
    }

    //error
    if (result.isError) {
      emit(
        state._copyWith(downloadAudio: ErDownloadStatus(result.asError.error)),
      );
    }
  }

  void _onPlayerState(ProcessingState playerState) {
    log(playerState.toString());

    if (playerState == ProcessingState.completed) {
      if (state.playingAyaId >= _versesCount!) {
        emit(state._copyWith(playAudio: SuDataStatus(false), playingAyaId: 1));
        return;
      }

      emit(state._copyWith(playingAyaId: state.playingAyaId + 1));
      playAudio();
    }
  }

  Future<void> playAudio({int? id}) async {
    //loading
    emit(state._copyWith(playAudio: const LoDataStatus(), playingAyaId: id));

    //scroll to position
    scrollController.scrollTo(
      index: (id ?? state.playingAyaId) - 1,
      duration: Constants.animationDuration,
      curve: Curves.easeInOut,
    );

    //play
    final result = await _repo.playAudio(id: id ?? state.playingAyaId);
    if (isClosed) return;

    //success
    if (result.isOk) {
      emit(state._copyWith(playAudio: SuDataStatus(true)));

      if (state.playingAyaId == -1) {
        emit(state._copyWith(playingAyaId: 1));
      }
    }

    //error
    if (result.isError) {
      emit(state._copyWith(playAudio: ErDataStatus(result.asError.error)));
    }
  }

  void pauseAudio() async {
    _repo.pauseAudio();
    emit(state._copyWith(playAudio: SuDataStatus(false)));
  }

  void setPlayingAyaId(int id) {
    _repo.playAudio(id: id);
    emit(state._copyWith(playingAyaId: id));
  }

  void removeTranslates() {
    for (var verse in _verses) {
      verse.translate = null;
    }
    emit(
      state._copyWith(getVerses: SuGetLimitStatus(_verses, _complatedVerses)),
    );
  }

  Future<void> getNewTranslates() async {
    //loading
    emit(state._copyWith(getVerses: const LoGetLimitStatus()));

    final req = LoadLimitReq(limit: _verses.length);

    //GET translates
    final result = await _repo.getTranslate(req: req);
    if (isClosed) return;

    //success
    if (result.isOk) {
      final translates = result.asOk.data;
      for (var i = 0; i < translates.length; i++) {
        _verses[i].translate = translates[i];
      }
      emit(
        state._copyWith(getVerses: SuGetLimitStatus(_verses, _complatedVerses)),
      );
    }

    //error
    if (result.isError) {
      emit(
        state._copyWith(getVerses: SuGetLimitStatus(_verses, _complatedVerses)),
      );
    }
  }

  Future<void> stopAudio() async {
    //loading
    emit(state._copyWith(playAudio: const LoDataStatus()));

    //stop
    await _repo.stopAudio();

    emit(state._copyWith(playAudio: SuDataStatus(false), playingAyaId: 1));
    scrollController.scrollTo(index: 0, duration: Constants.animationDuration);
  }

  @override
  Future<void> close() {
    _verseLimitTimer?.cancel();
    _verseLimitTimer = null;
    _playerStreamSubscription?.cancel();
    _playerStreamSubscription = null;

    return super.close();
  }
}
