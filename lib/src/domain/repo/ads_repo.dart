import 'dart:ui' show VoidCallback;

abstract interface class AdsRepo {
  const AdsRepo();

  ///load app open ad
  void loadAppOpen();

  ///show app open is loaded
  void showAppOpen();

  void loadAndWatchAppOpen({VoidCallback? onLoaded, VoidCallback? onFailed});

  void loadInterestitialAd({VoidCallback? onLoaded, VoidCallback? onFailed});

  bool isLoadedInterstitialAd();

  void showInterestitialAd();
}
