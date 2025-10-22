import 'package:dio/dio.dart';
import 'package:sura_apps_1_1/core/constants.dart';

import '../../../domain/request/download_audio_req.dart';

final class AudioApi {
  const AudioApi(this._dio);
  final Dio _dio;

  Future<Response> downloadZipFile(
    DownloadAudioReq req,
    void Function(double progress) onDownload,
  ) {
    //for example [https://makesence.org/quran/Ghamadi_40kbps/001.zip]
    final url =
        '${Constants.baseUrl}/${req.qari}/${Constants.formatToThreeDigits(req.suraChapter)}.zip';
    final savePath = '${req.documentDir.path}/audio/${req.qari}.zip';

    return _dio.download(
      url,
      savePath,
      onReceiveProgress: (count, total) => onDownload(count / total),
    );
  }
}
