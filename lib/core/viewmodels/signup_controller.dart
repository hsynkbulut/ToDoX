import 'package:anytime_todo_app/core/models/user/user_model.dart';
import 'package:anytime_todo_app/core/repositories/authentication/authentication_repository.dart';
import 'package:anytime_todo_app/core/repositories/user/user_repository.dart';
import 'package:anytime_todo_app/core/utils/popups/loaders.dart';
import 'package:anytime_todo_app/ui/auth/signup/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final creationDate = DateTime.now();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Signup
  void signup() async {
    try {
      /*
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Wea are processing your information...',
          ImagePaths.catPlayingLottie);
   
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
      */

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        // TFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        userId: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        creationDate: creationDate,
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      //TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Tebrikler',
          message:
              'Hesabınız oluşturuldu! Devam etmek için e-postayı doğrulayın.');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      //TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      //TFullScreenLoader.stopLoading();
    }
  }
}
