import 'package:just_audio/just_audio.dart';

final class AudioPlayerService {
  AudioPlayerService();
  final _player = AudioPlayer();

  Stream<ProcessingState> onAudioState() async* {
    await for (var state in _player.playerStateStream) {
      if (state.playing) yield state.processingState;
    }
  }

  Future<void> play(String path) async {
    await _player.setFilePath(path);
    _player.play();
  }

  Future<void> pause() => _player.pause();

  Future<void> stop() => _player.stop();
}
