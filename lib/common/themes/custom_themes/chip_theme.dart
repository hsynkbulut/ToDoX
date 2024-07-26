import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AppColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColors.black),
    selectedColor: AppColors.primaryColor, //Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppColors.whiteColor,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppColors.grey,
    labelStyle: TextStyle(color: AppColors.whiteColor),
    selectedColor: AppColors.primaryColor, //Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppColors.whiteColor,
  );
}
