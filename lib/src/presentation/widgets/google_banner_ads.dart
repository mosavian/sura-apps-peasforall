import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ivar_mobile_ads/ivar_mobile_ads.dart';

import '../../../flavors.dart';

// State class for banner ad
class BannerAdState {
  final BannerAd? bannerAd;
  final String? error;
  final bool isLoading;

  BannerAdState({this.bannerAd, this.error, this.isLoading = false});

  BannerAdState.loading() : bannerAd = null, error = null, isLoading = true;
  BannerAdState.success(BannerAd ad)
    : bannerAd = ad,
      error = null,
      isLoading = false;
  BannerAdState.error(String err)
    : bannerAd = null,
      error = err,
      isLoading = false;
}

// Helper class to handle banner ad loading with stream
class AdBannerController {
  final StreamController<BannerAdState> _controller =
      StreamController<BannerAdState>.broadcast();
  BannerAd? _currentAd;
  Timer? _refreshTimer;

  Stream<BannerAdState> get stream => _controller.stream;

  void loadBannerAd(AdSize size) {
    _controller.add(BannerAdState.loading());

    _currentAd?.dispose();

    _currentAd = BannerAd(
      size: size,
      adUnitId: F.bannerAdToken,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!_controller.isClosed) {
            _controller.add(BannerAdState.success(ad as BannerAd));
          }
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          debugPrint("Banner Ad Failed to Load: $err");
          if (!_controller.isClosed) {
            _controller.add(BannerAdState.error(err.message));
          }
        },
        onAdClicked: (ad) {
          debugPrint("Banner Ad Clicked");
        },
        onAdImpression: (ad) {
          debugPrint("Banner Ad Impression");
        },
      ),
    );

    _currentAd!.load();
  }

  void loadAdaptiveBannerAd(double screenWidth) async {
    _controller.add(BannerAdState.loading());

    _currentAd?.dispose();

    try {
      final AnchoredAdaptiveBannerAdSize? size =
          await AdSize.getAnchoredAdaptiveBannerAdSize(
            Orientation.portrait,
            screenWidth.truncate(),
          );

      if (size == null) {
        _controller.add(BannerAdState.error('Error when set banner size'));
        return;
      }

      _currentAd = BannerAd(
        size: size,
        adUnitId: F.bannerAdToken,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) async {
            if (_controller.isClosed) return;

            final platformSize = await (ad as BannerAd).getPlatformAdSize();
            if (platformSize == null) {
              final error = 'Error: getPlatformAdSize() returned null for $ad';
              log(error);
              ad.dispose();
              _controller.add(BannerAdState.error(error));
              return;
            }

            _controller.add(BannerAdState.success(ad));
          },
          onAdFailedToLoad: (ad, err) {
            ad.dispose();
            debugPrint("Adaptive Banner Ad Failed to Load: $err");
            if (!_controller.isClosed) {
              _controller.add(BannerAdState.error(err.message));
            }
          },
          onAdClicked: (ad) {
            debugPrint("Adaptive Banner Ad Clicked");
          },
          onAdImpression: (ad) {
            debugPrint("Adaptive Banner Ad Impression");
          },
        ),
      );

      _currentAd!.load();
    } catch (e) {
      _controller.add(BannerAdState.error(e.toString()));
    }
  }

  void dispose() {
    _refreshTimer?.cancel();
    _currentAd?.dispose();
    _controller.close();
  }
}

class GoogleBannerAds extends StatefulWidget {
  const GoogleBannerAds({
    this.adSize = AdSize.banner,
    this.initWidget,
    this.showIvarAdsWhenError = true,
    super.key,
  });

  final AdSize adSize;
  final Widget? initWidget;
  final bool showIvarAdsWhenError;

  @override
  State<GoogleBannerAds> createState() => _GoogleBannerAdsState();
}

class _GoogleBannerAdsState extends State<GoogleBannerAds>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late AdBannerController _adController;

  @override
  void initState() {
    _adController = AdBannerController();
    super.initState();
    // _checkIsRemoveAds();
    _adController.loadBannerAd(widget.adSize);
  }

  // void _checkIsRemoveAds() async {
  //   final isRemoveAds = await locator<SharedPreferences>().isRemovedAds();
  //   showAd = !isRemoveAds;
  //   if (showAd) {
  //     _adController.loadBannerAd(widget.adSize);
  //   }
  //   setState(() {});
  // }

  @override
  void dispose() {
    _adController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // برای حفظ وضعیت ویجت

    return StreamBuilder<BannerAdState>(
      stream: _adController.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isLoading) {
          return widget.initWidget ?? const SizedBox();
        }

        final state = snapshot.data!;

        if (state.bannerAd != null) {
          final bannerAd = state.bannerAd!;
          return SizedBox(
            height: bannerAd.size.height.toDouble(),
            width: bannerAd.size.width.toDouble(),
            child: AdWidget(ad: bannerAd),
          );
        }

        if (state.error != null && widget.showIvarAdsWhenError) {
          return _IvarMobileAds(widget.adSize, initWidget: widget.initWidget);
        }

        return widget.initWidget ?? const SizedBox();
      },
    );
  }
}

class GoogleBannerAdsAdaptive extends StatefulWidget {
  const GoogleBannerAdsAdaptive({this.showIvarAdsWhenError = true, super.key});

  final bool showIvarAdsWhenError;

  @override
  State<GoogleBannerAdsAdaptive> createState() =>
      _GoogleBannerAdsAdaptiveState();
}

class _GoogleBannerAdsAdaptiveState extends State<GoogleBannerAdsAdaptive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late AdBannerController _adController;

  @override
  void initState() {
    _adController = AdBannerController();
    super.initState();

    _loadBanner();
  }

  void _loadBanner() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final screenWidth = MediaQuery.of(context).size.width;
      _adController.loadAdaptiveBannerAd(screenWidth);
    });
  }

  // void _checkIsRemoveAds() async {
  //   final isRemoveAds = await locator<PrefsSource>().isRemovedAds();
  //   showAd = !isRemoveAds;
  //   if (showAd) {
  //     final screenWidth = MediaQuery.of(context).size.width;
  //     _adController.loadAdaptiveBannerAd(screenWidth);
  //   }
  //   setState(() {});
  // }

  @override
  void dispose() {
    _adController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // برای حفظ وضعیت ویجت

    return StreamBuilder<BannerAdState>(
      stream: _adController.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isLoading) {
          return const SizedBox();
        }

        final state = snapshot.data!;

        if (state.bannerAd != null) {
          final bannerAd = state.bannerAd!;
          return SafeArea(
            child: SizedBox(
              height: bannerAd.size.height.toDouble(),
              width: bannerAd.size.width.toDouble(),
              child: AdWidget(ad: bannerAd),
            ),
          );
        }

        if (state.error != null && widget.showIvarAdsWhenError) {
          return const _IvarMobileAds(AdSize.banner);
        }

        return const SizedBox();
      },
    );
  }
}

class _IvarMobileAds extends StatelessWidget {
  const _IvarMobileAds(this.admobSize, {this.initWidget});
  final AdSize admobSize;
  final Widget? initWidget;

  @override
  Widget build(BuildContext context) {
    late BannerAdSize size;
    if (admobSize == AdSize.largeBanner) {
      size = BannerAdSize.large;
    } else if (admobSize == AdSize.mediumRectangle) {
      size = BannerAdSize.mediumRectangle;
    } else {
      size = BannerAdSize.standard;
    }

    return FutureBuilder(
      future: IvarMobileAds.instance.loadBannerAd(
        size,
        listener: IvarBannerAdListener(
          onAdLoaded: (ad) {
            log('laoded');
          },
          onAdFailedToLoad: (errorMsg) {
            log('failed');
          },
        ),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return IvarBannerAdWidget(snapshot.data!);
        }
        return initWidget ?? const SizedBox();
      },
    );
  }
}
