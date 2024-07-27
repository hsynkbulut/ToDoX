import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/helpers/theme_utilities_extensions.dart'; // isDarkMode uzantısını içe aktar

extension AlertUtilitiesExtensions on BuildContext {
  /// Warning Dialog
  void warningDialog({
    required String message,
    required VoidCallback onYesPressed,
  }) {
    final dark = isDarkMode;
    showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Iconsax.warning_2,
            color: AppColors.error,
            size: 45,
          ),
          title: Text(
            'Uyarı',
            style: TextStyle(
              color: dark ? AppColors.gold : AppColors.error,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: dark ? AppColors.grey : AppColors.darkerGrey,
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.error,
              ),
              child: TextButton(
                child: const Text(
                  'Evet',
                  style: TextStyle(color: AppColors.white),
                ),
                onPressed: () async {
                  Navigator.of(context).pop(); //Başka sayfaya yönlendir
                  onYesPressed();
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.error),
              ),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Hayır',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Help Dialog
  void helpDialog({
    required String message,
  }) {
    final dark = isDarkMode;
    showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Iconsax.message_question,
            color: AppColors.warning,
            size: 45,
          ),
          title: Text(
            'Yardım',
            style: TextStyle(
              color: dark ? AppColors.gold : AppColors.warning,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: dark ? AppColors.grey : AppColors.darkerGrey,
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.warning),
              ),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Tamam',
                  style: TextStyle(color: AppColors.warning),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Info Dialog
  void infoDialog({
    required String message,
  }) {
    final dark = isDarkMode;
    showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Iconsax.information,
            color: AppColors.info,
            size: 45,
          ),
          title: Text(
            'Bilgi',
            style: TextStyle(
              color: dark ? AppColors.gold : AppColors.info,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: dark ? AppColors.grey : AppColors.darkerGrey,
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.info),
              ),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Tamam',
                  style: TextStyle(color: AppColors.info),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Success Dialog
  void successDialog({
    required String message,
  }) {
    final dark = isDarkMode;
    showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Iconsax.copy_success,
            color: AppColors.success,
            size: 90,
          ),
          title: Text(
            'Başarılı',
            style: TextStyle(
              color: dark ? AppColors.gold : AppColors.success,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: dark ? AppColors.grey : AppColors.darkerGrey,
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.success),
              ),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Tamam',
                  style: TextStyle(color: AppColors.success),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Error Dialog
  void errorDialog({
    required String message,
  }) {
    final dark = isDarkMode;
    showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Iconsax.forbidden_2,
            color: AppColors.error,
            size: 45,
          ),
          title: Text(
            'Hata',
            style: TextStyle(
              color: dark ? AppColors.gold : AppColors.error,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: dark ? AppColors.grey : AppColors.darkerGrey,
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.error),
              ),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Tamam',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
