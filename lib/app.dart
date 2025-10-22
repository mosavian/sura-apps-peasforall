import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart' as intl;

import 'config_locator.dart';
import 'core/assets.dart';
import 'core/config/app_theme.dart';
import 'flavors.dart';
import 'l10n/app_localizations.dart';
import 'src/presentation/bloc/settings_cubit/settings_cubit.dart';
import 'src/presentation/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({required this.isFirstAppOpen, super.key});
  final bool isFirstAppOpen;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SettingsCubit(locator()))],
      child: Builder(
        builder: (context) {
          return BlocConsumer<SettingsCubit, SettingsState>(
            buildWhen: (previous, current) =>
                previous.appLanguage != current.appLanguage,
            listenWhen: (previous, current) =>
                previous.appLanguage != current.appLanguage,
            listener: (context, state) {
              final appLanguage = state.appLanguage;
              intl.Intl.defaultLocale = appLanguage;
            },
            builder: (context, state) {
              final appLanguage = state.appLanguage;

              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Colors.teal.shade600,
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
                child: MaterialApp(
                  navigatorObservers: [
                    FirebaseAnalyticsObserver(
                      analytics: FirebaseAnalytics.instance,
                    ),
                  ],
                  debugShowCheckedModeBanner: false,
                  title: F.title,
                  locale: Locale(appLanguage), // یا Locale('en')
                  supportedLocales: const [
                    Locale('en'),
                    Locale('fa'),
                    Locale('ar'),
                  ],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  theme: AppTheme.light(font: Assets.iransansFont),
                  themeMode: ThemeMode.light,
                  home: _flavorBanner(child: SplashScreen(), show: kDebugMode),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) => show
      ? Banner(
          location: BannerLocation.topStart,
          message: F.name,
          color: Colors.green.withAlpha(150),
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            letterSpacing: 1.0,
          ),
          textDirection: TextDirection.ltr,
          child: child,
        )
      : Container(child: child);
}
