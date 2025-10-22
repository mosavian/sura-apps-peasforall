import 'dart:io';

import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

final class DeviceInfoService {
  const DeviceInfoService(this.timeZone);
  final String timeZone;

  Future<Directory> get documentDir => getApplicationDocumentsDirectory();

  String get deviceLanguageCode => Platform.localeName.split('_').first;

  bool get isIranianUser => timeZone == 'Asia/Tehran';
}
