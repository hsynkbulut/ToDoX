import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.primary, // Buton yazı rengi
      side: const BorderSide(
          color: AppColors.primary), // Buton Kenar kalınlığı rengi, Colors.blue
      textStyle: const TextStyle(
        fontFamily: 'SignikaNegative',
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary, // Buton yazı rengi
      //backgroundColor: AppColors.whiteColor, // Buton arkaplan rengi
      side: const BorderSide(
          color: AppColors
              .primary), // Buton Kenar kalınlığı rengi, Colors.blueAccent
      textStyle: const TextStyle(
        fontFamily: 'SignikaNegative',
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
