import 'dart:async';

import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/common/widgets/appbar/appbar.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_elevated_button.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_outlined_button.dart';
import 'package:anytime_todo_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:anytime_todo_app/common/widgets/texts/section_heading.dart';
import 'package:anytime_todo_app/core/repositories/authentication/authentication_repository.dart';
import 'package:anytime_todo_app/core/viewmodels/user_controller.dart';
import 'package:anytime_todo_app/ui/edit_profile/edit_profile_screen.dart';
import 'package:anytime_todo_app/ui/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    showBackArrow: true,
                    title: Text(
                      'Profilim',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Heading Profile Info
                  const TSectionHeading(
                    title: 'Profil Bilgileri',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TProfileMenu(
                    title: TTexts.firstName,
                    value: controller.user.value.firstName,
                    onPressed: () {},
                  ),

                  TProfileMenu(
                    title: TTexts.lastName,
                    value: controller.user.value.lastName,
                    onPressed: () {},
                  ),

                  TProfileMenu(
                    title: TTexts.email,
                    value: controller.user.value.email,
                    onPressed: () {},
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Account Edit Button
                  TElevatedButton(
                    text: TTexts.updateAccountButton,
                    onPressed: () => unawaited(
                      Get.to(
                        () => EditProfileScreen(user: controller.user.value),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.defaultSpace),

                  /// SignOut Button
                  TElevatedButton(
                    backgroundColor: AppColors.error,
                    text: TTexts.signOut,
                    onPressed: () {
                      AuthenticationRepository.instance.logout();
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Account Delete Button
                  TOutlinedButton(
                    text: TTexts.deleteAccountButton,
                    foregroundColor: AppColors.error,
                    borderSideColor: AppColors.error,
                    textColor: AppColors.error,
                    onPressed: controller.deleteAccountWarningPopup,
                  ),
                  const SizedBox(height: TSizes.defaultSpace),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
