import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.primaryColor,
    suffixIconColor: AppColors.primaryColor,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.dark),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColors.primaryColor,
    ),
    errorStyle: const TextStyle()
        .copyWith(fontStyle: FontStyle.normal, color: AppColors.error),
    floatingLabelStyle: const TextStyle().copyWith(
        color: AppColors.primaryColor.withOpacity(
            0.8)), //İnput'a tıklayınca yukarı çıkan minik text rengi, AppColors.primaryColor
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), //10
      borderSide: const BorderSide(
        width: 1, //4
        color: AppColors.grey, //AppColors.black
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.darkGrey,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.primaryColor,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.error,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 2,
        color: AppColors.warning,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.whiteColor,
    suffixIconColor: AppColors.whiteColor,
    labelStyle: const TextStyle()
        .copyWith(fontSize: 14, color: AppColors.whiteColor //Colors.black,
            ),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 14, color: AppColors.whiteColor //Colors.black,
            ),
    errorStyle: const TextStyle()
        .copyWith(fontStyle: FontStyle.normal, color: AppColors.error),
    floatingLabelStyle: const TextStyle().copyWith(
        color: AppColors.whiteColor.withOpacity(
            0.8)), //İnput'a tıklayınca yukarı çıkan minik text rengi
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.primaryColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.whiteColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: AppColors.warning),
    ),
  );
}
