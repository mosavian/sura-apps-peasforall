import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart' as intl;
import 'package:ivar_mobile_ads/ivar_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app.dart';
import 'config_locator.dart';
import 'core/constants.dart';
import 'firebase_options.dart';
import 'flavors.dart';
import 'src/data/source/local/shared_prefs_service.dart';
import 'src/domain/repo/settings_repo.dart';

Future<void> main() async {
  ///
  /// 🔥 بهترین ساختار: کل برنامه داخل Zone
  ///
  await runZonedGuarded(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      /// تعیین Flavor
      F.appFlavor = Flavor.values.firstWhere(
        (element) => element.name == appFlavor,
      );

      /// Initialize Firebase
      if (DefaultFirebaseOptions.isSupported) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }

      /// Mobile Ads
      IvarMobileAds.instance.init(Constants.ivarAdsAppID);

      /// DI, DB, Cache ...
      await configLocator();

      ///
      /// 🌐 NOTIFICATION: opened app
      ///
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        final payload = message.data['payload'];
        if (payload != null) handleNotificationClick(payload);
      });

      ///
      /// 🌐 NOTIFICATION: app cold start
      ///
      RemoteMessage? initialMessage = await FirebaseMessaging.instance
          .getInitialMessage();
      if (initialMessage != null) {
        final payload = initialMessage.data['payload'];
        if (payload != null) {
          await _safeLaunchUrl(payload);
        }
      }

      ///
      /// 🔥 Crashlytics Setup
      ///
      FlutterError.onError = (FlutterErrorDetails details) {
        if (_isCriticalFlutterError(details)) {
          FirebaseCrashlytics.instance.recordFlutterFatalError(details);
        }

        if (kDebugMode) {
          FlutterError.presentError(details);
        }
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        if (_shouldReportError(error)) {
          FirebaseCrashlytics.instance.recordError(error, stack);
        }
        return true;
      };

      /// ⚙️ Locale + Settings
      final prefs = locator<SharedPrefsService>();
      final isFirstAppOpen = await prefs.isFirstOpenApp;
      prefs.incrementAppOpenCount();

      final appLanguage = await locator<SettingsRepo>().appLanguage;
      intl.Intl.defaultLocale = appLanguage;

      if (isFirstAppOpen) {
        locator<SettingsRepo>().setInitilTranslator();
      }

      /// 🚀 RUN
      runApp(App(isFirstAppOpen: isFirstAppOpen));

      /// Splash remove
      FlutterNativeSplash.remove();
    },
    (error, stack) {
      if (_shouldReportError(error)) {
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
    },
  );
}

Future<void> handleNotificationClick(String? payload) async {
  if (payload == null || payload.isEmpty) return;

  await _safeLaunchUrl(payload);
}

Future<bool> _safeLaunchUrl(String url) async {
  if (!url.startsWith('http://') && !url.startsWith('https://')) return false;

  try {
    return await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } catch (e, s) {
    FirebaseCrashlytics.instance.recordError(e, s);
    return false;
  }
}

//
// ────────────────────────────────────────────────────────────────
//   🔥 Error Filters
// ────────────────────────────────────────────────────────────────
//

bool _shouldReportError(Object error) {
  if (error is DioException) {
    return _isCriticalDio(error);
  }
  return true;
}

bool _isCriticalDio(DioException ex) {
  switch (ex.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.cancel:
      return false; // خطاهای معمول شبکه → مهم نیستن

    case DioExceptionType.badResponse:
      final status = ex.response?.statusCode ?? 0;
      return status >= 500; // فقط 5xx بحرانی

    default:
      return true; // SSL, Unknown = مهم
  }
}

bool _isCriticalFlutterError(FlutterErrorDetails details) {
  if (details.exception is DioException) {
    return _isCriticalDio(details.exception as DioException);
  }

  const nonCritical = [
    'RenderFlex overflowed',
    'Image failed to load',
    'Unable to load asset',
  ];

  for (var m in nonCritical) {
    if (details.exceptionAsString().contains(m)) {
      return false;
    }
  }

  return true;
}
