import 'package:package_info_plus/package_info_plus.dart';

final class PackageInfoService {
  const PackageInfoService(this._packageInfo);
  final PackageInfo _packageInfo;

  String get version => _packageInfo.version;
}
