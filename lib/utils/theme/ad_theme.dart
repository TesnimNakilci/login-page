//import 'package:login/utils/ad_utils.dart';
import 'package:log_in/utils/theme/ad_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ADTheme{
  //app theme
  static ThemeData get lightTheme {
    return ThemeData(
      //  primarySwatch: ADUtils.getMaterialColor(ADColors.accentColor),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 0,
          unselectedItemColor: Colors.grey,
          selectedItemColor: ADColors.accentColor,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light),
        ),
      hintColor: Colors.grey,
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white))),
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: MaterialStateProperty.all(ADColors.accentColor.withOpacity(0.2))))
    );
  }
}