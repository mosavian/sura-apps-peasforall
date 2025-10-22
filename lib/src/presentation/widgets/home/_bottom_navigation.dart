part of '../../screens/home_screen.dart';

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingScreen + Constants.paddingScreen,
              vertical: Constants.defaultPadding,
            ),
            child: _Audio(),
          ),
          GoogleBannerAdsAdaptive(),
        ],
      ),
    );
  }
}
