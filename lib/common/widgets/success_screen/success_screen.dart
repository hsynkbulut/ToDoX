import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/common/helpers/device_utilities_extensions.dart';
import 'package:anytime_todo_app/common/styles/spacing_styles.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    super.key,
  });

  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Lottie.asset(image, width: context.screenWidth * 0.6),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Buttons
              TElevatedButton(text: TTexts.tContinue, onPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}
