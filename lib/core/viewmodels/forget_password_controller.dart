import 'package:anytime_todo_app/core/repositories/authentication/authentication_repository.dart';
import 'package:anytime_todo_app/core/utils/popups/loaders.dart';
import 'package:anytime_todo_app/ui/auth/password_configuration/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      /*
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', ImagePaths.catPlayingLottie);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
      */

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        //TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      //TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(
          title: 'E-posta Gönderildi',
          message:
              'Hesabınız oluşturuldu! Devam etmek için e-postayı doğrulayın.'
                  .tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      // TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Ooops', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      /*
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', ImagePaths.catPlayingLottie);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
      */

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      //TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(
          title: 'E-posta Gönderildi',
          message:
              'Şifrenizi Sıfırlamak için E-posta Bağlantısı Gönderildi.'.tr);
    } catch (e) {
      // Remove Loader
      // TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Ooops', message: e.toString());
    }
  }
}
