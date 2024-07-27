import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/common/helpers/t_device_utility.dart';
import 'package:anytime_todo_app/core/viewmodels/onboarding_controller.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text(TTexts.skip),
        ));
  }
}
