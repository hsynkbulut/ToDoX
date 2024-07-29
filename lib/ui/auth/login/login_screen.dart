import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/common/helpers/theme_utilities_extensions.dart';
import 'package:anytime_todo_app/ui/auth/login/widgets/login_form.dart';
import 'package:anytime_todo_app/ui/auth/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode;
    return SafeArea(
      child: Scaffold(
        backgroundColor: dark ? AppColors.black : AppColors.white,
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Logo, Title & Sub-Title
                LoginHeader(),

                /// Form
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
