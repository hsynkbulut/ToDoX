import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/themes/custom_themes/appbar_theme.dart';
import 'package:anytime_todo_app/common/themes/custom_themes/bottom_sheet_theme.dart';
import 'package:anytime_todo_app/common/themes/custom_themes/checkbox_theme.dart';
import 'package:anytime_todo_app/common/themes/custom_themes/chip_theme.dart';
import 'package:anytime_todo_app/common/themes/custom_themes/elevated_button_theme.dart';
import 'package:anytime_todo_app/common/themes/custom_themes/outlined_button_theme.dart';
import 'package:anytime_todo_app/common/themes/custom_themes/text_field_theme.dart';
import 'package:anytime_todo_app/common/themes/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor, //Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    //primarySwatch: AppColors.primaryMaterialColor,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor, //Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppColors.black, //AppColors.primaryColor
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
