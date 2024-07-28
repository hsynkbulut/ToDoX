import 'package:anytime_todo_app/core/repositories/authentication/authentication_repository.dart';
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
      /*
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', ImagePaths.catPlayingLottie);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
      */

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        //TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      //TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      // TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Ooops', message: e.toString());
    } finally {
      // Remove Loader
      // TFullScreenLoader.stopLoading();
    }
  }
}