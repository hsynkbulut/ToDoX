import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.primary,
    suffixIconColor: AppColors.primary,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.dark),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColors.primary,
    ),
    errorStyle: const TextStyle()
        .copyWith(fontStyle: FontStyle.normal, color: AppColors.error),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColors.primary.withOpacity(
        0.8,
      ),
    ), //İnput'a tıklayınca yukarı çıkan minik text rengi
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), //10
      borderSide: const BorderSide(
        color: AppColors.grey, //AppColors.black
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        color: AppColors.darkGrey,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        color: AppColors.primary,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
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
    prefixIconColor: AppColors.white,
    suffixIconColor: AppColors.white,
    labelStyle: const TextStyle().copyWith(
      fontSize: 14, color: AppColors.white, //Colors.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14, color: AppColors.white, //Colors.black,
    ),
    errorStyle: const TextStyle()
        .copyWith(fontStyle: FontStyle.normal, color: AppColors.error),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColors.white.withOpacity(
        0.8,
      ),
    ), //İnput'a tıklayınca yukarı çıkan minik text rengi
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        color: AppColors.primary,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: AppColors.warning),
    ),
  );
}
