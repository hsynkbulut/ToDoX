import 'dart:async';

import 'package:anytime_todo_app/common/constants/image_strings.dart';
import 'package:anytime_todo_app/core/repositories/authentication/authentication_repository.dart';
import 'package:anytime_todo_app/core/utils/helpers/network_manager.dart';
import 'package:anytime_todo_app/core/utils/popups/full_screen_loader.dart';
import 'package:anytime_todo_app/core/utils/popups/loaders.dart';
import 'package:anytime_todo_app/ui/auth/password_configuration/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  Future<void> sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'İsteğiniz işleme alınıyor...',
        ImagePaths.documentProcessingLottie,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Show connectivity error and return
        TLoaders.errorSnackBar(
          title: 'Internet yok',
          message: 'Lütfen internet bağlantınızı kontrol edin.',
        );
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Show Success Screen
      TLoaders.successSnackBar(
        title: 'E-posta Gönderildi',
        message:
            'Şifre sıfırlamak için e-posta adresinize bir bağlantı gönderildi!'
                .tr,
      );

      // Redirect
      unawaited(Get.to(() => ResetPasswordScreen(email: email.text.trim())));
    } catch (e) {
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Ooops', message: e.toString());
    }
  }

  Future<void> resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'İsteğiniz işleme alınıyor...',
        ImagePaths.documentProcessingLottie,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Show connectivity error and return
        TLoaders.errorSnackBar(
          title: 'Internet yok',
          message: 'Lütfen internet bağlantınızı kontrol edin.',
        );
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Show Success Screen
      TLoaders.successSnackBar(
        title: 'E-posta Gönderildi',
        message: 'Şifrenizi Sıfırlamak için E-posta Bağlantısı Gönderildi.'.tr,
      );
    } catch (e) {
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Ooops', message: e.toString());
    }
  }
}
