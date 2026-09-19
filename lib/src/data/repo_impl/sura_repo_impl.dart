import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:just_audio/just_audio.dart';

import '../../../core/constants.dart';
import '../../../core/entity.dart';
import '../../../core/my_exception.dart';
import '../../../core/request/load_limit_request.dart';
import '../../../core/result.dart';
import '../../domain/entity/verse_entity.dart';
import '../../domain/repo/sura_repo.dart';
import '../../domain/request/download_audio_req.dart';
import '../source/local/audio_player_service.dart';
import '../source/local/device_info_service.dart';
import '../source/local/person_db_source.dart';
import '../source/local/shared_prefs_service.dart';
import '../source/local/verse_db_source.dart';
import '../source/remote/audio_api.dart';

final class SuraRepoImpl implements SuraRepo {
  const SuraRepoImpl(
    this._dbSource,
    this._personDbSource,
    this._audioSource,
    this._prefs,
    this._deviceInfo,
    this._player,
  );
  final VerseDbSource _dbSource;
  final PersonDbSource _personDbSource;
  final AudioApi _audioSource;
  final SharedPrefsService _prefs;
  final DeviceInfoService _deviceInfo;
  final AudioPlayerService _player;

  @override
  Future<Result<List<VerseEntity>>> getVerses(LoadLimitReq req) async {
    try {
      //get translator tbl name
      final translatorId = await _prefs.translatorId;
      String? translatorTblName;
      if (translatorId != null) {
        translatorTblName = await _personDbSource.getTranslatorTblNameById(
          translatorId,
        );
      }

      //GET
      final res = await _dbSource.getVerses(req);
      final List<VerseEntity> verses = entityListFromJson<VerseEntity>(
        res,
        VerseEntity.fromJson,
      );

      //add translate
      if (translatorTblName != null) {
        final translate = await _dbSource.getTranslate(
          translator: translatorTblName,
          loadLimitReq: req,
        );
        for (var i = 0; i < verses.length; i++) {
          verses[i].translate = translate[i];
        }
      }

      //حذف بسم الله از اولین آیه اگر وجود داشت
      if (verses[0].arabic.contains('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ')) {
        verses[0].arabic = verses[0].arabic
            .replaceFirst('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', '')
            .trim();
      }

      return Ok(verses);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<Result<List<String>>> getTranslate({LoadLimitReq? req}) async {
    try {
      final translatorId = await _prefs.translatorId;
      String? translator;
      if (translatorId != null) {
        translator = await _personDbSource.getTranslatorTblNameById(
          translatorId,
        );
      }

      if (translator == null) return Error('No translator selected');

      //GET translate
      final translate = await _dbSource.getTranslate(
        translator: translator,
        loadLimitReq: req,
      );

      return Ok(translate);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<Result<bool>> isDownloadedAudio() async {
    try {
      final activeQariId = await _prefs.qariId;

      final audioName = await _personDbSource.getAudioNameById(activeQariId);
      if (audioName == null) return Error('قاری پیدا نشد');

      final documentDir = await _deviceInfo.documentDir;

      final existsAudioFiles = await _isExistsAudioFiles(
        '${documentDir.path}/audio/$audioName',
      );

      return Ok(existsAudioFiles);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<Result<String>> downloadAudio(
    void Function(double? progress) onDownload,
  ) async {
    try {
      //find internal storage
      final documentDir = await _deviceInfo.documentDir;

      //get active qari id
      final activeQariId = await _prefs.qariId;

      //find qari sound name by id
      final audioName = await _personDbSource.getAudioNameById(activeQariId);
      if (audioName == null) {
        return Error('قاری پیدا نشد');
      }

      //چک میکنیم که آیا فایل های صوتی از قبل وجود داره یا نه
      final existsAudioFiles = await _isExistsAudioFiles(
        '${documentDir.path}/audio/$audioName',
      );
      if (existsAudioFiles) return Ok('فایل های صوتی از قبل وجود داشت');

      final suraChapter = await _dbSource.suraChapter();
      final req = DownloadAudioReq(
        suraChapter: suraChapter,
        qari: audioName,
        documentDir: documentDir,
      );

      //شروع دانلود فایل زیپ
      await _audioSource.downloadZipFile(req, onDownload);
      onDownload(null);

      //اکسترکت فایل های صوتی از فایل زیپ
      final zipFilePath = '${documentDir.path}/audio/$audioName.zip';
      final outputPath = '${documentDir.path}/audio/$audioName/';
      await extractFileToDisk(zipFilePath, outputPath);

      //حذف فایل زیپ
      File(zipFilePath).delete();

      return Ok('فایل های صوتی دانلود شد');
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  Future<bool> _isExistsAudioFiles(String dirPath) async {
    //count audio files
    final audioCount = await _countFilesInDir(dirPath);
    if (audioCount == 0) return false;

    //count all verses
    final versesCount = await _dbSource.countVerses();

    return audioCount >= versesCount;
  }

  Future<int> _countFilesInDir(String dirPath) async {
    final Directory dir = Directory(dirPath);

    // بررسی وجود دایرکتوری
    if (!await dir.exists()) return 0;

    // لیست محتویات دایرکتوری
    final List<FileSystemEntity> entities = dir.listSync();

    // فقط فایل‌ها را نگه می‌داریم (دایرکتوری‌ها حذف می‌شوند)
    final files = entities
        .where((e) => FileSystemEntity.isFileSync(e.path))
        .toList();

    return files.length;
  }

  @override
  Stream<ProcessingState> onAudoPlayerState() => _player.onAudioState();

  @override
  Future<Result<void>> playAudio({int? id}) async {
    try {
      //get qari by id
      final qariId = await _prefs.qariId;
      final qariAudioName = await _personDbSource.getAudioNameById(qariId);
      if (qariAudioName == null) return Error('قاری یافت نشد');

      //get sura chapter
      final suraChapterNumber = await _dbSource.suraChapter();
      final threeDigitsSuraChapter = Constants.formatToThreeDigits(
        suraChapterNumber,
      );

      //check is exists audio
      final documentDir = await _deviceInfo.documentDir;
      final threeDigitsayaNumber = Constants.formatToThreeDigits(id ?? 1);
      final audioPath =
          '${documentDir.path}/audio/$qariAudioName/$threeDigitsSuraChapter$threeDigitsayaNumber.mp3';
      final existsFile = await File(audioPath).exists();
      if (!existsFile) return Error('صوت رو دانلود کنید');

      //play
      await _player.play(audioPath);

      return Ok(null);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<void> pauseAudio() => _player.pause();

  @override
  Future<Result<int>> countOfVerses() async {
    try {
      final count = await _dbSource.countVerses();

      return Ok(count);
    } catch (err) {
      return MyException.handleError(err);
    }
  }

  @override
  Future<void> stopAudio() => _player.stop();
}
