import 'package:just_audio/just_audio.dart';

import '../../../core/request/load_limit_request.dart';
import '../../../core/result.dart';
import '../entity/verse_entity.dart';

abstract interface class SuraRepo {
  const SuraRepo();

  Future<Result<int>> countOfVerses();

  Future<Result<List<VerseEntity>>> getVerses(LoadLimitReq req);

  Future<Result<List<String>>> getTranslate({LoadLimitReq? req});

  Future<Result<bool>> isDownloadedAudio();

  Future<Result<String>> downloadAudio(
    void Function(double? progress) onDownload,
  );

  Stream<ProcessingState> onAudoPlayerState();

  Future<Result<void>> playAudio({int? id});

  Future<void> pauseAudio();

  Future<void> stopAudio();
}
