import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/image_strings.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/ui/auth/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode;
    return Scaffold(
      backgroundColor: dark ? AppColors.black : AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back<void>(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              const Image(
                height: 160,
                image: AssetImage(ImagePaths.appLogo),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Title
              Text(
                TTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const SignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
