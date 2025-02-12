import 'package:anytime_todo_app/common/constants/image_strings.dart';
import 'package:anytime_todo_app/core/repositories/authentication/authentication_repository.dart';
import 'package:anytime_todo_app/core/utils/helpers/network_manager.dart';
import 'package:anytime_todo_app/core/utils/popups/full_screen_loader.dart';
import 'package:anytime_todo_app/core/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Giriş yapıyorsun...',
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
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // Save Data if Remember me is selected
      if (rememberMe.value) {
        await localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        await localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      await AuthenticationRepository.instance
          .loginWithEmailPassword(email.text.trim(), password.text.trim());

      // Redirect
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Ooops', message: e.toString());
    }
  }
}
