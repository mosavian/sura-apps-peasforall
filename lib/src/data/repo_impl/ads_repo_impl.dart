import 'dart:ui';

import '../../domain/repo/ads_repo.dart';
import '../source/remote/admob_ads_service.dart';

final class AdsRepoImpl implements AdsRepo {
  const AdsRepoImpl(this._admobService);
  final AdmobAdsService _admobService;

  @override
  void loadAppOpen() {
    _admobService.loadAppOpen();
  }

  @override
  void showAppOpen() {
    _admobService.showAppOpen();
  }

  @override
  void loadAndWatchAppOpen({VoidCallback? onLoaded, VoidCallback? onFailed}) {
    _admobService.loadAppOpen(
      onFailed: onFailed,
      onLoaded: () {
        if (onLoaded != null) onLoaded();
        _admobService.showAppOpen();
      },
    );
  }

  @override
  bool isLoadedInterstitialAd() => _admobService.isLoadedInterstitialAd();

  @override
  void loadInterestitialAd({VoidCallback? onLoaded, VoidCallback? onFailed}) {
    _admobService.loadInterestitialAd(onLoaded: onLoaded, onFailed: onFailed);
  }

  @override
  void showInterestitialAd() => _admobService.showInterestitialAd();
}
