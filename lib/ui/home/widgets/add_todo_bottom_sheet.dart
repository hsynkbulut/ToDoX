import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/common/helpers/device_utilities_extensions.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_elevated_button.dart';
import 'package:anytime_todo_app/core/utils/validators/validation.dart';
import 'package:anytime_todo_app/core/viewmodels/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoBottomSheet extends StatelessWidget {
  const AddTodoBottomSheet({required this.controller, super.key});

  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    final width = context.screenWidth;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: width * 0.07,
          right: width * 0.07,
          top: height * 0.04,
          // To get the height of the keyboard using MediaQuery
          bottom: MediaQuery.of(context).viewInsets.bottom + height * 0.04,
        ),
        child: Form(
          key: controller.todoFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (value) =>
                    TValidator.validateEmptyText(value, 'Başlık'),
                controller: controller.title,
                decoration: const InputDecoration(labelText: 'Başlık'),
              ),
              SizedBox(height: height * 0.025),
              TextFormField(
                validator: (value) =>
                    TValidator.validateEmptyText(value, 'Açıklama'),
                controller: controller.description,
                decoration: const InputDecoration(labelText: 'Açıklama'),
              ),
              SizedBox(height: height * 0.025),
              TElevatedButton(
                text: TTexts.createButton,
                onPressed: () {
                  if (controller.todoFormKey.currentState!.validate()) {
                    controller.saveTodoRecord();
                    Navigator.of(Get.overlayContext!).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
