import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kabor_driver/core/core.dart';

class AppTheme {
  static ThemeMode get mode => ThemeMode.light;
  ThemeData get _baseTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.primaryColor,
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
      scaffoldBackgroundColor: AppColors.backgroundLightColor,
      textTheme: TextTheme(
        // headline1: const TextStyle(),
        titleLarge: GoogleFonts.nunitoSans(
          color: AppColors.backgroundBlack2,
        ),
        titleMedium: const TextStyle(),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColor,
      ),
    );
  }

  ThemeData get _darkTheme => _baseTheme.copyWith(
        scaffoldBackgroundColor: AppColors.backgroundBlackColor,
      );

  ThemeData currentTheme(ThemeMode mode) {
    if (mode == ThemeMode.light) {
      return _baseTheme;
    } else if (mode == ThemeMode.dark) {
      return _darkTheme;
    } else {
      return _baseTheme;
    }
  }
}
