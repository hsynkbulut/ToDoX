import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/widgets/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static final darkMode = Get.context!.isDarkMode;
  static void openLoadingDialog(String text, String animation) {
    showDialog<void>(
      context: Get.overlayContext!,
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, //Disable popping with the back button
        child: Container(
          color: darkMode ? AppColors.dark : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static dynamic stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
