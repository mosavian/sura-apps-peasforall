part of 'sura_cubit.dart';

final class SuraState {
  const SuraState({
    this.getVerses = const LoGetLimitStatus(),
    this.downloadAudio = const LoDownloadStatus(),
    this.playAudio = const InitDataStatus(),
    this.playingAyaId = 1,
  });

  //statuses
  final GetLimitStatus<VerseEntity> getVerses;
  final DownloadStatus downloadAudio;
  final int playingAyaId;
  final DataStatus<bool> playAudio;

  //copy with
  SuraState _copyWith({
    GetLimitStatus<VerseEntity>? getVerses,
    DownloadStatus? downloadAudio,
    int? playingAyaId,
    DataStatus<bool>? playAudio,
  }) {
    return SuraState(
      getVerses: getVerses ?? this.getVerses,
      downloadAudio: downloadAudio ?? this.downloadAudio,
      playingAyaId: playingAyaId ?? this.playingAyaId,
      playAudio: playAudio ?? this.playAudio,
    );
  }
}
