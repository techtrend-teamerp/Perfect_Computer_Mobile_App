import 'package:flutter/material.dart';

import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/constants/common_constants.dart';

class AppTheme {
  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;

  /// For Light Theme
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: CommonConstants.kPrimaryColor,
      primaryContainer: CommonConstants.kPrimaryColor,
      secondary: CommonConstants.kSecondaryColor,
      error: Colors.red,
      brightness: Brightness.light,
    ),
    primaryColor: CommonConstants.kPrimaryColor,
    primarySwatch: AppColor.primaryColor,
    fontFamily: CommonConstants.regular,
    scaffoldBackgroundColor: const Color(0XFFfafafa),
    elevatedButtonTheme: AppTheme.elevatedButtonThemeData,
    iconButtonTheme: AppTheme.iconButtonThemeData,
    inputDecorationTheme: AppTheme.inputDecorationTheme,
    appBarTheme: appBarTheme,
  );

  /// for Dart Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.black,
    fontFamily: CommonConstants.regular,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  );

  /// AppBar Theme Data Set
  static AppBarTheme appBarTheme = const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );

  /// Elevated Button Theme Data Set
  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: CommonConstants.kPrimaryColor,
      shape: const StadiumBorder(),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  /// Icon Button Theme set
  static IconButtonThemeData iconButtonThemeData = IconButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      // backgroundColor: CommonConstants.kPrimaryColor,
      shape: const StadiumBorder(),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  /// For All TextFormField
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    iconColor: CommonConstants.kPrimaryColor,
    prefixIconColor: CommonConstants.kPrimaryColor,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: CommonConstants.defaultPadding,
      vertical: 10,
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
          Radius.circular(CommonConstants.defaultBorderRadius)),
      borderSide: BorderSide(
        color: AppColor.borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
          Radius.circular(CommonConstants.defaultBorderRadius)),
      borderSide: BorderSide(
        color: AppColor.primaryColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
          Radius.circular(CommonConstants.defaultBorderRadius)),
      borderSide: BorderSide(
        color: AppColor.borderColor,
      ),
    ),
    hintStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.lightGrey,
    ),
  );
}
