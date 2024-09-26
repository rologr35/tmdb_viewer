
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/constants.dart';

class AppTheme{

  static ThemeData get darkTheme => ThemeData(
      primaryColor: AppColors.primary,
      fontFamily: AppConstants.font,
      useMaterial3: false,
      primaryTextTheme: _getTextTheme(false),
      textTheme: _getTextTheme(false),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: AppColors.white),
        unselectedIconTheme: IconThemeData(color: AppColors.grayDarkest),
        selectedLabelStyle: TextStyle(color: AppColors.black),
        unselectedLabelStyle: TextStyle(color: AppColors.grayDarkest),
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.grayDarkest,
      ),
      scaffoldBackgroundColor: AppColors.black,
      iconTheme: const IconThemeData(color: AppColors.white),
      primaryIconTheme: const IconThemeData(color: AppColors.white),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(color: AppColors.white),
          actionsIconTheme: IconThemeData(color: AppColors.white)),
      brightness: Brightness.dark,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.grayDark),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.primary, brightness: Brightness.dark));

  static ThemeData get lightTheme => ThemeData(
      primaryColor: AppColors.primary,
      fontFamily: AppConstants.font,
      useMaterial3: false,
      primaryTextTheme: _getTextTheme(true),
      textTheme: _getTextTheme(true),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: AppColors.black),
        unselectedIconTheme: IconThemeData(color: AppColors.gray),
        selectedLabelStyle: TextStyle(color: AppColors.white),
        unselectedLabelStyle: TextStyle(color: AppColors.gray),
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.gray,
      ),
      scaffoldBackgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.black),
      primaryIconTheme: const IconThemeData(color: AppColors.black),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black),
          actionsIconTheme: IconThemeData(color: AppColors.black)),
      brightness: Brightness.light,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.grayDark),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.primary, brightness: Brightness.light));

  static TextTheme _getTextTheme(bool isLight) {
    return TextTheme(
      displayLarge: isLight ? Typography.material2021().black.displayLarge?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.displayLarge?.copyWith(fontFamily: AppConstants.font),
      displayMedium: isLight ? Typography.material2021().black.displayMedium?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.displayMedium?.copyWith(fontFamily: AppConstants.font),
    displaySmall: isLight ? Typography.material2021().black.displaySmall?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.displaySmall?.copyWith(fontFamily: AppConstants.font),
    headlineLarge: isLight ? Typography.material2021().black.headlineLarge?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.headlineLarge?.copyWith(fontFamily: AppConstants.font),
    headlineMedium: isLight ? Typography.material2021().black.headlineMedium?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.headlineMedium?.copyWith(fontFamily: AppConstants.font),
      headlineSmall: isLight ? Typography.material2021().black.headlineSmall?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.headlineSmall?.copyWith(fontFamily: AppConstants.font),
      titleLarge: isLight ? Typography.material2021().black.titleLarge?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.titleLarge?.copyWith(fontFamily: AppConstants.font),
      titleMedium: isLight ? Typography.material2021().black.titleMedium?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.titleMedium?.copyWith(fontFamily: AppConstants.font),
      titleSmall: isLight ? Typography.material2021().black.titleSmall?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.titleSmall?.copyWith(fontFamily: AppConstants.font),
      bodyLarge: isLight ? Typography.material2021().black.bodyLarge?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.bodyLarge?.copyWith(fontFamily: AppConstants.font),
      bodyMedium: isLight ? Typography.material2021().black.bodyMedium?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.bodyMedium?.copyWith(fontFamily: AppConstants.font),
      bodySmall: isLight ? Typography.material2021().black.bodySmall?.copyWith(fontFamily: AppConstants.font) : Typography.material2021().white.bodySmall?.copyWith(fontFamily: AppConstants.font),
    );
  }
}