import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/common/helpers/device_utilities_extensions.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_elevated_button.dart';
import 'package:anytime_todo_app/core/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:anytime_todo_app/core/models/todo/todo_model.dart';
import 'package:anytime_todo_app/core/viewmodels/todo_controller.dart';
import 'package:get/get.dart';

class UpdateTodoBottomSheet extends StatelessWidget {
  final TodoModel todo;
  final TodoController controller;
  const UpdateTodoBottomSheet(
      {required this.todo, super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.initUpdateControllers(todo);
    final height = context.screenHeight;
    final width = context.screenWidth;
    return Form(
      key: controller.todoFormKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: width * 0.07,
          right: width * 0.07,
          top: height * 0.04,
          // To get the height of the keyboard using MediaQuery
          bottom: MediaQuery.of(context).viewInsets.bottom + height * 0.04,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller.updateTitleController,
              validator: (value) =>
                  TValidator.validateEmptyText(value, 'Başlık'),
              decoration: const InputDecoration(labelText: 'Başlık'),
            ),
            SizedBox(height: height * 0.025),
            TextFormField(
              controller: controller.updateDescriptionController,
              validator: (value) =>
                  TValidator.validateEmptyText(value, 'Açıklama'),
              decoration: const InputDecoration(labelText: 'Açıklama'),
            ),
            SizedBox(height: height * 0.025),
            TElevatedButton(
              text: TTexts.updateButton,
              onPressed: () {
                controller.updateTodoDetails(todo);
                Navigator.of(Get.overlayContext!).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
