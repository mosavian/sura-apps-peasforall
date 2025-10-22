import 'dart:io';

import '../../../core/request/request.dart';

final class DownloadAudioReq extends Request {
  const DownloadAudioReq({
    required this.suraChapter,
    required this.qari,
    required this.documentDir,
  });

  final int suraChapter;
  final String qari;
  final Directory documentDir;
}
