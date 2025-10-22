final class Constants {
  const Constants();

  static const baseUrl = 'https://makesence.org/quran';
  static const ivarAdsAppID = '686e16aa8acfc04553ca0630';
  static const marketDeveloperLink =
      'https://play.google.com/store/apps/developer?id=meissamv';
  static const myEmail = 'mosavi433@gmail.com';
  static const donateLink = 'https://zarinp.al/670909';

  ///variables
  static const double paddingScreen = 20;
  static const double defaultPadding = 12;
  static const double borderRadius = 11;
  static const Duration animationDuration = Duration(milliseconds: 300);

  static String formatToThreeDigits(int number) {
    return number.toString().padLeft(3, '0');
  }
}
