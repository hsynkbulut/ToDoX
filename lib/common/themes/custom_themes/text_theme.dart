import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      //height: 1.6,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      //height: 1.6,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.black, // ElevatedButton text rengi
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.dark, // Input'un içinde yazı yazma rengi
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.darkerGrey, // Input text rengi
      //height: 1.6,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.black.withOpacity(0.5),
      //height: 2.26,
    ),
    labelLarge: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.black.withOpacity(0.5),
    ),

    ///
    labelSmall: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.black.withOpacity(0.5),
    ),
    displayLarge: const TextStyle(
      fontFamily: 'SignikaNegative',
      fontSize: 40,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    displayMedium: const TextStyle(
      fontFamily: 'SignikaNegative',
      fontSize: 32,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    displaySmall: const TextStyle(
      fontFamily: 'SignikaNegative',
      fontSize: 28,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ), // ElevatedButton text rengi
    titleMedium: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.white, // Input'un içinde yazı yazma rengi
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.white, // Input text rengi
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.white.withOpacity(0.5),
    ),

    ///
    labelLarge: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.white.withOpacity(0.5),
    ),

    labelSmall: const TextStyle().copyWith(
      fontFamily: 'SignikaNegative',
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.white.withOpacity(0.5),
    ),
    displayLarge: const TextStyle(
      fontFamily: 'SignikaNegative',
      fontSize: 40,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    displayMedium: const TextStyle(
      fontFamily: 'SignikaNegative',
      fontSize: 32,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    displaySmall: const TextStyle(
      fontFamily: 'SignikaNegative',
      fontSize: 28,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
  );
}
