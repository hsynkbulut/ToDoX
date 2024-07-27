import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.transparent,
    surfaceTintColor: AppColors.transparent,
    iconTheme: IconThemeData(color: AppColors.black, size: TSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: AppColors.black, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black, //AppColors.primaryColor,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.transparent,
    surfaceTintColor: AppColors.transparent,
    iconTheme: IconThemeData(color: AppColors.black, size: TSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: AppColors.white, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
  );
}
