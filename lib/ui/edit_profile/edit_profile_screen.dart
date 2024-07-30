import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/common/widgets/appbar/appbar.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_elevated_button.dart';
import 'package:anytime_todo_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:anytime_todo_app/common/widgets/texts/section_heading.dart';
import 'package:anytime_todo_app/core/models/user/user_model.dart';
import 'package:anytime_todo_app/core/utils/validators/validation.dart';
import 'package:anytime_todo_app/core/viewmodels/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({required this.user, super.key});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance..initUpdateControllers(user);
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
                      'Profilimi Düzenle',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Heading Personal Info
                  const TSectionHeading(
                    title: 'Kişisel Bilgiler',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Edit Form
                  Form(
                    key: controller.editFormKey,
                    child: Column(
                      children: [
                        /// FirstName
                        TextFormField(
                          validator: (value) =>
                              TValidator.validateEmptyText('İsim', value),
                          controller: controller.updateFirstName,
                          decoration: const InputDecoration(
                            counter: SizedBox.shrink(), //maxLength hidden
                            labelText: TTexts.firstName,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                          keyboardType: TextInputType.name,
                          maxLength: 20,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// LastName
                        TextFormField(
                          validator: (value) =>
                              TValidator.validateEmptyText('Soyisim', value),
                          controller: controller.updateLastName,
                          decoration: const InputDecoration(
                            counter: SizedBox.shrink(), //maxLength hidden
                            labelText: TTexts.lastName,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                          keyboardType: TextInputType.text,
                          maxLength: 20,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// Account Edit Button
                        TElevatedButton(
                          text: TTexts.updateButton,
                          onPressed: () => controller.updateUserDetails(user),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
