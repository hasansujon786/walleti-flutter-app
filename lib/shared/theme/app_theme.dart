import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.lightGrey,
        error: AppColors.error,
        outline: AppColors.extraLightGrey,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),

      // textTheme: TextThemes.textTheme,
      // primaryTextTheme: TextThemes.primaryTextTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.lightGrey,
        error: AppColors.error,
        background: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.black,
        // titleTextStyle: AppTextStyles.h2,
      ),

      // primaryTextTheme: TextThemes.primaryTextTheme,
      // fontFamily: AppTextStyles.fontFamily,
      // textTheme: TextThemes.darkTextTheme,
    );
  }
}
