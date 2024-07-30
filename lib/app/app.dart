import 'package:anytime_todo_app/bindings/general_bindings.dart';
import 'package:anytime_todo_app/common/themes/app_theme.dart';
import 'package:anytime_todo_app/ui/onboard/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const OnboardingScreen(),
    );
  }
}
