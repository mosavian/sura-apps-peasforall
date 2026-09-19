final class Constants {
  const Constants();

  static const baseUrl = 'https://makesence.org/quran';
  static const ivarAdsAppID = '693e6caaf53e68227c9e67cd';
  static const marketDeveloperLink =
      'https://play.google.com/store/apps/dev?id=9018409929726816176';
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
