import 'package:anytime_todo_app/common/constants/image_strings.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/common/helpers/device_utilities_extensions.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_elevated_button.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_text_button.dart';
import 'package:anytime_todo_app/core/viewmodels/forget_password_controller.dart';
import 'package:anytime_todo_app/ui/auth/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              Center(
                  child: Lottie.asset(ImagePaths.resetPasswordEmailLottie,
                      width: width * 0.8, height: height * 0.4)),
              SizedBox(height: height * 0.01),

              /// Email, Title & SubTitle
              Text(email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              SizedBox(height: height * 0.02),
              Text(TTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.left),
              SizedBox(height: height * 0.02),
              Text(TTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.left),
              SizedBox(height: height * 0.04),

              /// Buttons
              TElevatedButton(
                  text: TTexts.done,
                  onPressed: () => Get.offAll(() => const LoginScreen())),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: double.infinity,
                child: TTextButton(
                  text: TTexts.resendEmail,
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
