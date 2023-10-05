import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      // fontFamily: AppTextStyles.fontFamily,
      // primaryColor: AppColors.primary,
      // colorScheme: const ColorScheme.dark(
      //   primary: AppColors.primary,
      //   secondary: AppColors.lightGrey,
      //   error: AppColors.error,
      //   background: AppColors.black,
      // ),
      // // backgroundColor: AppColors.black,
      // scaffoldBackgroundColor: AppColors.black,
      // textTheme: TextThemes.darkTextTheme,
      // primaryTextTheme: TextThemes.primaryTextTheme,
      // appBarTheme: const AppBarTheme(
      //   elevation: 0,
      //   backgroundColor: AppColors.black,
      //   titleTextStyle: AppTextStyles.h2,
      // ),
    );
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      // primaryColor: AppColors.primary,
      // textTheme: TextThemes.textTheme,
      // primaryTextTheme: TextThemes.primaryTextTheme,
      // colorScheme: const ColorScheme.light(
      //   primary: AppColors.primary,
      //   secondary: AppColors.lightGrey,
      //   error: AppColors.error,
      // ),
      // appBarTheme: const AppBarTheme(
      //   elevation: 0,
      //   backgroundColor: AppColors.primary,
      // ),
    );
  }
}
