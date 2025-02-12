import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/image_strings.dart';
import 'package:anytime_todo_app/common/helpers/device_utilities_extensions.dart';
import 'package:anytime_todo_app/core/models/todo/todo_model.dart';
import 'package:anytime_todo_app/core/viewmodels/todo_controller.dart';
import 'package:anytime_todo_app/ui/home/widgets/update_todo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    required this.isCompleted,
    required this.controller,
    super.key,
  });
  final bool isCompleted;
  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    return Obx(() {
      final filteredTodos = controller.todos
          .where((todo) => todo.isCompleted == isCompleted)
          .toList()
        ..sort((a, b) => b.creationDate.compareTo(a.creationDate));

      if (filteredTodos.isEmpty) {
        return Center(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(height * 0.01),
                  width: height * 0.4,
                  height: height * 0.4,
                  child: Center(
                    child: Lottie.asset(
                      ImagePaths.emptyListLottie,
                      width: height * 0.4,
                      height: height * 0.4,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Todo eklemek için (+) butonuna tıkla',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        itemCount: filteredTodos.length,
        itemBuilder: (context, index) {
          final todo = filteredTodos[index];
          final dt = todo.creationDate;
          return Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.01),
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    padding: EdgeInsets.symmetric(vertical: height * 0.005),
                    onPressed: (context) {
                      _showUpdateTodoBottomSheet(context, controller, todo);
                    },
                    backgroundColor: AppColors.success,
                    foregroundColor: AppColors.white,
                    icon: Iconsax.edit,
                    label: 'Güncelle',
                  ),
                  SlidableAction(
                    padding: EdgeInsets.symmetric(vertical: height * 0.005),
                    onPressed: (context) {
                      controller.removeTodoWarningPopup(todo.todoId);
                    },
                    backgroundColor: AppColors.error,
                    foregroundColor: AppColors.white,
                    icon: Iconsax.trash,
                    label: 'Sil',
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  todo.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColors.white),
                ),
                subtitle: Text(todo.description),
                leading: Checkbox(
                  side: const BorderSide(color: AppColors.white, width: 2),
                  checkColor: AppColors.black,
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.white;
                    } else {
                      return AppColors.transparent;
                    }
                  }),
                  value: todo.isCompleted,
                  onChanged: (value) {
                    controller.updateCheckbox(todo.todoId, value ?? false);
                  },
                ),
                trailing: Text(
                  '${dt.day}/${dt.month}/${dt.year}',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  void _showUpdateTodoBottomSheet(
    BuildContext context,
    TodoController controller,
    TodoModel todo,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return UpdateTodoBottomSheet(controller: controller, todo: todo);
      },
    );
  }
}
