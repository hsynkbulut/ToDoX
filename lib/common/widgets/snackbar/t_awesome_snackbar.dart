import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';

void showAwesomeSnackBar({
  required BuildContext context,
  required String title,
  required String message,
  required ContentType contentType,
}) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 3),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
