import 'dart:developer';
import 'dart:ui' show VoidCallback;

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sura_apps_1_1/flavors.dart';

final class AdmobAdsService {
  AdmobAdsService();
  final _appOpenToken = F.appOpenAdToken;
  AppOpenAd? _appOpenAd;
  InterstitialAd? _interstitialAd;
  bool _isShowingAd = false;

  void loadAppOpen({VoidCallback? onLoaded, VoidCallback? onFailed}) {
    if (_appOpenAd != null) return;

    AppOpenAd.load(
      adUnitId: _appOpenToken,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          if (onLoaded != null) onLoaded();
          log('success to load app open ad');
        },
        onAdFailedToLoad: (error) {
          _appOpenAd?.dispose();
          _appOpenAd = null;
          if (onFailed != null) onFailed();
          log('App Open failed to load: $error');
        },
      ),
    );
  }

  void showAppOpen() {
    if (_appOpenAd == null) {
      log('Tried to show ad before available.');
      return;
    }
    if (_isShowingAd) {
      log('Tried to show ad while already showing an ad.');
      return;
    }

    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        log('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        log('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        // add(const LoadAppOpenAdEvent());
      },
      onAdDismissedFullScreenContent: (ad) {
        log('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        // add(const LoadAppOpenAdEvent());
      },
    );

    ///show
    _appOpenAd?.show();
  }

  void loadInterestitialAd({
    VoidCallback? onLoaded,
    VoidCallback? onFailed,
  }) async {
    if (isLoadedInterstitialAd()) return;
    InterstitialAd.load(
      adUnitId: F.interstitialAdToken,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          if (onLoaded != null) onLoaded();
        },
        onAdFailedToLoad: (error) {
          log(error.message);
          if (onFailed != null) onFailed();
        },
      ),
    );
  }

  bool isLoadedInterstitialAd() => _interstitialAd != null;

  void showInterestitialAd() async {
    if (!isLoadedInterstitialAd()) return;

    await _interstitialAd!.show();

    _interstitialAd = null;
  }
}
