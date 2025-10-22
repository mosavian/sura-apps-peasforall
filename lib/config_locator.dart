import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sura_apps_1_1/src/data/repo_impl/ads_repo_impl.dart';
import 'package:sura_apps_1_1/src/data/repo_impl/settings_repo_impl.dart';
import 'package:sura_apps_1_1/src/data/repo_impl/sura_repo_impl.dart';
import 'package:sura_apps_1_1/src/data/source/local/audio_player_service.dart';
import 'package:sura_apps_1_1/src/data/source/local/device_info_service.dart';
import 'package:sura_apps_1_1/src/data/source/local/package_info_service.dart';
import 'package:sura_apps_1_1/src/data/source/local/person_db_source.dart';
import 'package:sura_apps_1_1/src/data/source/local/shared_prefs_service.dart';
import 'package:sura_apps_1_1/src/data/source/local/verse_db_source.dart';
import 'package:sura_apps_1_1/src/data/source/remote/admob_ads_service.dart';
import 'package:sura_apps_1_1/src/data/source/remote/audio_api.dart';
import 'package:sura_apps_1_1/src/domain/repo/ads_repo.dart';
import 'package:sura_apps_1_1/src/domain/repo/settings_repo.dart';
import 'package:sura_apps_1_1/src/domain/repo/sura_repo.dart';

final locator = GetIt.instance;

Future<void> configLocator() async {
  final dio = Dio();
  locator.registerSingleton(dio);

  final packgeInfo = await PackageInfo.fromPlatform();

  final timeZone = await FlutterTimezone.getLocalTimezone();

  //local source
  locator.registerLazySingleton(() => DeviceInfoService(timeZone));
  locator.registerLazySingleton(() => PackageInfoService(packgeInfo));
  locator.registerLazySingleton(() => SharedPrefsService());
  locator.registerLazySingleton(() => VerseDbSource());
  locator.registerLazySingleton(() => PersonDbSource());
  locator.registerLazySingleton(() => AudioPlayerService());
  //remote source
  locator.registerLazySingleton(() => AudioApi(locator()));
  locator.registerLazySingleton(() => AdmobAdsService());
  //repository
  locator.registerLazySingleton<SettingsRepo>(
    () => SettingsRepoImpl(locator(), locator(), locator(), locator()),
  );
  locator.registerLazySingleton<SuraRepo>(
    () => SuraRepoImpl(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerLazySingleton<AdsRepo>(() => AdsRepoImpl(locator()));
}
