import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

final class AppTheme {
  const AppTheme();

  static ThemeData light({String? font}) {
    final primary = Colors.teal;
    final secondary = Colors.amber.shade600;
    const textColor = Color.fromARGB(255, 66, 66, 78);
    const backgroundColor1 = Colors.white;
    const backgroundColor2 = Color(0xfffafafa);
    const backgroundColor3 = Color(0xffefefef);

    return _theme(
      primary: primary,
      secondary: secondary,
      textColor: textColor,
      backgroundColor: backgroundColor1,
      inputbackgroundColor: backgroundColor2,
      secondaryHeaderColor: backgroundColor3,
      font: font,
    );
  }

  static ThemeData dark({String? font}) {
    const primary = Color.fromARGB(255, 68, 131, 255);
    // const textColor = Color(0xfffafafa);
    // const backgroundColor1 = Color(0xff171A26);
    // const backgroundColor2 = Color(0xff1C202E);
    // const backgroundColor3 = Color(0xff202538);
    // const primary = Color.fromARGB(255, 68, 138, 199);
    // const primary = Color.fromARGB(255, 74, 176, 255);
    // const primary = Color(0xff5EB5F7);
    // const primary = Color(0xFF00ADEF);

    const secondary = Color.fromARGB(255, 248, 137, 27); //Color(0xFFF58220);
    const textColor = Color(0xffF5F5F5);
    const backgroundColor1 = Color(0xff0E1621);
    const backgroundColor2 = Color(0xff17212B);
    const backgroundColor3 = Color(0xff1B2734);

    // final primary = Color.fromARGB(255, 68, 131, 255);
    // final secondary = Color.fromARGB(255, 248, 137, 27);
    // const textColor = Color(0xfffafafa);
    // const backgroundColor1 = Color(0xff1D2733);
    // const backgroundColor2 = Color(0xff252D3A);
    // const backgroundColor3 = Color.fromARGB(255, 42, 51, 65);

    return _theme(
      primary: primary,
      secondary: secondary,
      textColor: textColor,
      backgroundColor: backgroundColor1,
      inputbackgroundColor: backgroundColor2,
      secondaryHeaderColor: backgroundColor3,
      font: font,
    );
  }

  static ThemeData _theme({
    required Color primary,
    required Color secondary,
    required Color textColor,
    required Color backgroundColor,
    required Color inputbackgroundColor,
    required Color secondaryHeaderColor,
    String? font,
  }) {
    return ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primary,
        secondary: secondary, // نارنجی همراه اول
        onPrimary: backgroundColor,
        onSecondary: backgroundColor,
        surface: inputbackgroundColor, // این رنگ پس‌زمینه را کنترل می‌کند
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primary,
        linearTrackColor: inputbackgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      hintColor: textColor.withOpacity(0.6),
      hoverColor: inputbackgroundColor,
      shadowColor: textColor,
      canvasColor: backgroundColor,
      secondaryHeaderColor: secondaryHeaderColor,
      highlightColor: textColor.withAlpha(10),
      splashColor: textColor.withAlpha(12),
      dividerColor: inputbackgroundColor,
      popupMenuTheme: PopupMenuThemeData(
        color: secondaryHeaderColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: font,
        ),
        iconColor: textColor,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateColor.resolveWith((states) => secondary),
        trackColor: WidgetStateColor.resolveWith(
          (states) => inputbackgroundColor,
        ),
        trackOutlineColor: WidgetStateColor.resolveWith(
          (states) => secondaryHeaderColor,
        ),
        overlayColor: WidgetStateColor.resolveWith(
          (states) => textColor.withAlpha(10),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          shadowColor: textColor,
          overlayColor: textColor,
          backgroundColor: textColor.withAlpha(7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          textStyle: TextStyle(fontFamily: font),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: primary,
          shadowColor: textColor,
          overlayColor: textColor,
          disabledBackgroundColor: primary.withAlpha(180),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),

          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: font,
          ),
          iconColor: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: font,
        ),
        iconColor: textColor.withOpacity(0.7),
        selectedTileColor: primary.withOpacity(0.1),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: inputbackgroundColor,
        foregroundColor: textColor,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 17,
          fontFamily: font,
        ),
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   systemNavigationBarColor: _lightInputBackgroundColor,
        //   systemNavigationBarIconBrightness: Brightness.light,
        //   statusBarIconBrightness: Brightness.light,
        //   statusBarBrightness: Brightness.dark,
        // ),
      ),

      iconTheme: IconThemeData(color: primary),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 24,
          fontFamily: font,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 21,
          fontFamily: font,
        ),
        titleSmall: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          fontFamily: font,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 17,
          fontFamily: font,
        ),
        bodyMedium: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: font,
        ),
        bodySmall: TextStyle(
          color: textColor.withOpacity(0.6),
          fontWeight: FontWeight.w300,
          fontSize: 11,
          fontFamily: font,
        ),
      ),
    );
  }
}
