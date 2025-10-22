import 'dart:async';
import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ivar_mobile_ads/ivar_mobile_ads.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

import '../../../config_locator.dart';
import '../../../core/assets.dart';
import '../../../core/constants.dart';
import '../../../core/ming_cute_font.dart';
import '../../../core/status/data_indexed_status.dart';
import '../../../core/status/data_status.dart';
import '../../../core/status/download_status.dart';
import '../../../core/status/get_limit_status.dart';
import '../../../core/status/get_status.dart';
import '../../../core/status/indexed_status.dart';
import '../../../core/widgets/custom_dialog.dart';
import '../../../core/widgets/custom_error_state.dart';
import '../../../core/widgets/custom_loading_state.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../core/widgets/star_button.dart';
import '../../../flavors.dart';
import '../../../l10n/app_localizations.dart';
import '../../data/source/local/device_info_service.dart';
import '../../data/source/local/package_info_service.dart';
import '../../data/source/local/shared_prefs_service.dart';
import '../../domain/entity/qari_entity.dart';
import '../../domain/entity/translator_entity.dart';
import '../../domain/entity/verse_entity.dart';
import '../../domain/repo/ads_repo.dart';
import '../../domain/repo/settings_repo.dart';
import '../bloc/settings_cubit/settings_cubit.dart';
import '../bloc/sura_cubit/sura_cubit.dart';
import '../widgets/donate_dialog.dart';
import '../widgets/google_banner_ads.dart';
import '../widgets/rate_dialog.dart';

part '../widgets/home/_app_bar.dart';
part '../widgets/home/_body.dart';
part '../widgets/home/_bottom_navigation.dart';
part '../widgets/home/_drawer.dart';
part '../widgets/home/body/_verses.dart';
part '../widgets/home/bottom_navigation/_audio.dart';
part '../widgets/home/dialog/_languages.dart';
part '../widgets/home/dialog/_person.dart';

Timer? showInterestitialAdTimer;
void _interestitialAd() {
  final adsRepo = locator<AdsRepo>();

  //load ad
  adsRepo.loadInterestitialAd();

  //show timer
  showInterestitialAdTimer?.cancel();
  showInterestitialAdTimer = Timer(Duration(seconds: 15), () {
    //show ad (is loaded)
    adsRepo.showInterestitialAd();
  });
}

/// Listens for app foreground events and shows app open ads.
class AppLifecycleReactor {
  AppLifecycleReactor(this.context);
  final BuildContext context;

  ///گوش دادن به بسته شدن اپ یا رزیوم شدن
  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream.forEach(
      (state) => _onAppStateChanged(state),
    );
  }

  void _onAppStateChanged(AppState appState) {
    // Try to show an app open ad if the app is being resumed and
    // we're not already showing an app open ad.
    if (appState == AppState.foreground) {
      log("forground");

      ///show app open ad
      locator<AdsRepo>().showAppOpen();

      //لود و نمایش تبلیغ تمام صفحه
      _interestitialAd();
    }
    if (appState == AppState.background) {
      log("background");

      ///load app open ad
      locator<AdsRepo>().loadAppOpen();
    }
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? _lastBackPressed;

  @override
  void initState() {
    super.initState();

    AppLifecycleReactor(context).listenToAppStateChanges();
    Timer(Duration(seconds: 25), () {
      if (mounted) IvarMobileAds.instance.showInterstitialAd(context);
    });
    _init();
  }

  void _init() async {
    showRateDialog();

    //اگر زمان نمایش دیالوگ دونیت بود، تبلیغات تمام صفحه نشون نده
    final isShowDonateDialog = await locator<SettingsRepo>().isShowDonateDate();
    if (isShowDonateDialog) {
      showDonateDialog();
    } else {
      _interestitialAd();
    }
  }

  void showRateDialog() async {
    final prefs = locator<SharedPrefsService>();

    if ((await prefs.appOpenCount) != 2 || (await prefs.isRatedUser)) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final showReportDialog = await showDialog<bool?>(
        context: context,
        builder: (context) {
          return RateDialog();
        },
      );

      await Future.delayed(Duration(milliseconds: 200));

      if (!mounted || showReportDialog != true) return;

      final sent = await showDialog<bool?>(
        context: context,
        builder: (context) {
          return ReportDialog(myEmail: Constants.myEmail, appName: F.title);
        },
      );

      if (sent == true && mounted) {
        CustomSnackBar.success(context, message: 'thank you');
      }
    });
  }

  void showDonateDialog() async {
    //تایمر 15 ثانیه ای میزاریم تا تبلیغ اپ اوپن رو دیده باشه بعد دیالوگ نشون میدیم
    Timer(Duration(seconds: 15), () async {
      if (!context.mounted) return;

      final result = await showDialog<bool>(
        context: context,
        builder: (context) {
          return DonateDialog();
        },
      );

      if (result == true && mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return DonateDialog2();
          },
        );
      }

      //load and show ad
      _interestitialAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        const duration = Duration(seconds: 4);
        if (_lastBackPressed == null ||
            now.difference(_lastBackPressed!) > duration) {
          _lastBackPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('برای خروج دوباره دکمه بازگشت را بزنید'),
              duration: duration,
              backgroundColor: Color.fromARGB(255, 36, 35, 50),
            ),
          );
          return false;
        }
        return true;
      },
      child: BlocProvider(
        create: (context) => SuraCubit(locator()),
        child: Stack(
          children: [
            Positioned.fill(
              child: SafeArea(
                child: Image.asset(Assets.suraBackgroundIMG, fit: BoxFit.fill),
              ),
            ),
            Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.transparent,
              body: _Body(_scaffoldKey),
              bottomNavigationBar: _BottomNavigation(),
              drawer: Drawer(width: screenWidth * 0.7, child: _Drawer()),
            ),
          ],
        ),
      ),
    );
  }
}
