import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  if (DefaultFirebaseOptions.isSupported) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  //initilize IVAR MOBILE ADS
  IvarMobileAds.instance.init(Constants.ivarAdsAppID);

  await Future.wait([configLocator()]);

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    final payload = message.data['payload'];
    if (payload != null) handleNotificationClick(payload);
  });

  RemoteMessage? initialMessage = await FirebaseMessaging.instance
      .getInitialMessage();
  if (initialMessage != null) {
    String? payload = initialMessage.data['payload'];
    if (payload != null &&
        (payload.startsWith('http://') || payload.startsWith('https://'))) {
      if (!await launchUrl(
        Uri.parse(payload),
        mode: LaunchMode.externalApplication,
      )) {
        print('Could not launch $payload');
      }
    }
  }

  ///setup firebase crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  final prefs = locator<SharedPrefsService>();
  final isFirstAppOpen = await prefs.isFirstOpenApp;
  prefs.incrementAppOpenCount();

  final appLanguage = await locator<SettingsRepo>().appLanguage;
  intl.Intl.defaultLocale = appLanguage;

  if (isFirstAppOpen) {
    locator<SettingsRepo>().setInitilTranslator();
  }

  runApp(App(isFirstAppOpen: isFirstAppOpen));
}

Future handleNotificationClick(String? payload) async {
  if (payload == null || payload.isEmpty) {
    print('Notification clicked but payload is null or empty');
    return;
  }

  print('Handling notification click with payload: $payload');

  if (payload.startsWith('http://') || payload.startsWith('https://')) {
    try {
      if (!await launchUrl(
        Uri.parse(payload),
        mode: LaunchMode.externalApplication,
      )) {
        // If the URL cannot be launched, throw an exception
        print('Could not launch $payload');
      }
    } catch (e, _) {
      print('Could not launch $payload: $e');
    }
  } else {
    print('Payload is not a URL, handle accordingly');
  }
}
