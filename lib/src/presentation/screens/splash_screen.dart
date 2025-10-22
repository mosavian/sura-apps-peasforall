import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ivar_mobile_ads/ivar_mobile_ads.dart';

import '../../../config_locator.dart';
import '../../../core/assets.dart';
import '../../../core/constants.dart';
import '../../../core/my_navigator.dart';
import '../../../core/widgets/custom_loading_state.dart';
import '../../../flavors.dart';
import '../../data/source/local/shared_prefs_service.dart';
import '../../domain/repo/ads_repo.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  bool _hasNavigated = false;

  void _navigateToMainScreen() {
    if (!_hasNavigated) {
      _hasNavigated = true;
      timer?.cancel();

      MyNavigator.pushReplacement(context, HomeScreen());
    }
  }

  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(seconds: 4), () {
      _navigateToMainScreen();
    });

    _admob();
  }

  Future<void> _admob() async {
    //initilize admob
    await MobileAds.instance.initialize();

    final prefs = locator<SharedPrefsService>();

    if ((await prefs.appOpenCount) == 2 && (await prefs.isRatedUser) == false) {
      _navigateToMainScreen();
      return;
    }

    final adRepo = locator<AdsRepo>();

    adRepo.loadAndWatchAppOpen(
      onLoaded: () {
        _navigateToMainScreen();
      },
      onFailed: () {
        IvarMobileAds.instance.loadInterstitialAd();
        _navigateToMainScreen();
      },
    );

    //load app open
    // Future.delayed(Duration.zero, () {
    //   final adRepo = locator<AdsRepo>();

    //   adRepo.loadAndWatchAppOpen(
    //     onLoaded: () {
    //       _navigateToMainScreen();
    //     },
    //     onField: () {
    //       _navigateToMainScreen();
    //     },
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            child: Image.asset(Assets.splashBackgroundIMG, fit: BoxFit.fill),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(),
          body: const _Body(),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(Constants.paddingScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset(Assets.quranIMG, width: 100, height: 100),
                Text(
                  F.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontFamily: Assets.uthmanTahaFont,
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
          ),
          const CustomLoadingState(color: Colors.white),
        ],
      ),
    );
  }
}
