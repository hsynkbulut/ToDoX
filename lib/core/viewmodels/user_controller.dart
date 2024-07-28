import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/core/models/user/user_model.dart';
import 'package:anytime_todo_app/core/repositories/authentication/authentication_repository.dart';
import 'package:anytime_todo_app/core/repositories/user/user_repository.dart';
import 'package:anytime_todo_app/core/utils/popups/loaders.dart';
import 'package:anytime_todo_app/ui/auth/login/login_screen.dart';
import 'package:anytime_todo_app/ui/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  final updateEmail = TextEditingController();
  final updatePassword = TextEditingController();
  final updateFirstName = TextEditingController();
  final updateLastName = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      print('Kullanıcı kaydı getirilirken hata oluştu: $e');
      user(UserModel.empty());
    }
  }

  // Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          userId: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          email: userCredentials.user!.email ?? '',
          creationDate: DateTime.now(),
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Veri kaydedilmedi',
          message:
              'Bilgilerinizi kaydederken bir şeyler yanlış gitti. Verilerinizi Profilinizden yeniden kaydedebilirsiniz.');
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Hesap Sil',
      middleText:
          'Hesabınızı kalıcı olarak silmek istediğinizden emin misiniz? Bu işlem geri alınamaz ve tüm verileriniz kalıcı olarak kaldırılır.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            side: const BorderSide(color: AppColors.error)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Sil')),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('İptal'),
      ),
    );
  }

  // Delete User Account
  void deleteUserAccount() async {
    Get.to(() => const ReAuthLoginForm());
  }

  // RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateWithEmailAndPasswordUser() async {
    try {
      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        // TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Ooops', message: e.toString());
    }
  }

  void initUpdateControllers(UserModel user) {
    updateEmail.text = user.email;
    updateFirstName.text = user.firstName;
    updateLastName.text = user.lastName;
  }

  Future<void> updateUserDetails(UserModel user) async {
    try {
      // Form Validation
      if (!editFormKey.currentState!.validate()) {
        return;
      }

      // Update todo data in the Firebase Firestore
      final updatedUser = UserModel(
        userId: user.userId,
        firstName: updateFirstName.text.trim(),
        lastName: updateLastName.text.trim(),
        email: updateEmail.text.trim(),
        creationDate: user.creationDate,
      );

      await userRepository.updateUserDetails(updatedUser);

      TLoaders.successSnackBar(
          title: 'Başarılı', message: 'Kullanıcı bilgileri güncellendi.');
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Hata',
          message: 'Kullanıcı bilgileri güncellenirken bir hata oluştu.');
    }
  }
}
