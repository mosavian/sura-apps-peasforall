import 'package:flutter/services.dart';

final class Assets {
  //dir
  static const _dataPath = 'assets/data';
  static const _imagePath = 'assets/images';

  //data
  static const personDataDb = '$_dataPath/person.db';
  static const personDataZip = '$_dataPath/person.zip';

  //images
  static const suraBackgroundIMG = '$_imagePath/sura_background.jpg';
  static const dialogTopDetailIMG = '$_imagePath/top_detail.png';
  static const dialogLeftDetailIMG = '$_imagePath/left_detail.png';
  static const dialogRightDetailIMG = '$_imagePath/right_detail.png';
  static const splashBackgroundIMG = '$_imagePath/splash_background.jpg';
  static const quranIMG = '$_imagePath/quran.png';
  static const starIMG = '$_imagePath/button_star.png';
  static const myInfoIMG = '$_imagePath/my_info.jpg';

  //fonts
  static const uthmanTahaFont = 'UthmanTaha';
  static const vazirFont = 'Vazir';
  static const iransansFont = 'IranSans';
  static const samimFont = 'Samim';

  static Future<bool> assetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (e) {
      return false;
    }
  }
}
