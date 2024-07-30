import 'dart:async';

import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/core/models/todo/todo_model.dart';
import 'package:anytime_todo_app/core/repositories/authentication/authentication_repository.dart';
import 'package:anytime_todo_app/core/repositories/todo/todo_repository.dart';
import 'package:anytime_todo_app/core/utils/popups/loaders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  static TodoController get instance => Get.find();

  RxList<TodoModel> todos = <TodoModel>[].obs;
  RxString searchQuery = ''.obs;
  final todoRepository = Get.put(TodoRepository());
  late final TodoModel todo;

  // Variables
  final title = TextEditingController();
  final description = TextEditingController();
  final creationDate = DateTime.now();
  GlobalKey<FormState> todoFormKey = GlobalKey<FormState>();
  final updateTitleController = TextEditingController();
  final updateDescriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAllTodos();
    searchQuery.listen(filterTodos);
  }

  void filterTodos(String query) {
    if (query.isEmpty) {
      fetchAllTodos();
    } else {
      todos.assignAll(
        todos
            .where(
              (todo) => todo.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList(),
      );
    }
  }

  Future<void> updateSearchQuery(String query) async {
    searchQuery.value = query;
  }

  // Fetch all todos for the current user.
  Future<void> fetchAllTodos() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid ?? '';
      final userTodos = await todoRepository.fetchTodosByUserId(userId);
      todos(userTodos);
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Yükleme Hatası',
        message: 'Todolar yüklenemedi.',
      );
    }
  }

  // Save a new `todo` record.
  Future<void> saveTodoRecord() async {
    try {
      // Form Validation
      if (!todoFormKey.currentState!.validate()) {
        return;
      }

      // Save `todo` data in the Firebase Firestore
      final newTodo = TodoModel(
        userId: AuthenticationRepository.instance.authUser!.uid,
        todoId: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title.text.trim(),
        description: description.text.trim(),
        isCompleted: false,
        creationDate: creationDate,
      );

      await todoRepository.saveTodoRecord(newTodo);

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Tebrikler',
        message: 'Todo başarıyla oluşturuldu!',
      );

      todos.add(newTodo);
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Kaydetme Hatası',
        message: 'Todo kaydedilirken bir hata oluştu.',
      );
    }
  }

  void initUpdateControllers(TodoModel todo) {
    updateTitleController.text = todo.title;
    updateDescriptionController.text = todo.description;
  }

  Future<void> updateTodoDetails(TodoModel todo) async {
    try {
      // Form Validation
      if (!todoFormKey.currentState!.validate()) {
        return;
      }

      // Update `todo` data in the Firebase Firestore
      final updatedTodo = TodoModel(
        userId: todo.userId,
        todoId: todo.todoId,
        title: updateTitleController.text.trim(),
        description: updateDescriptionController.text.trim(),
        isCompleted: todo.isCompleted,
        creationDate: todo.creationDate,
      );

      await todoRepository.updateTodoDetails(updatedTodo);

      final index = todos.indexWhere((t) => t.todoId == updatedTodo.todoId);
      if (index != -1) {
        todos[index] = updatedTodo;
      }

      TLoaders.successSnackBar(title: 'Başarılı', message: 'Todo güncellendi.');
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Hata',
        message: 'Todo güncellenirken bir hata oluştu.',
      );
    }
  }

  Future<void> updateCheckbox(String todoId, dynamic isCompleted) async {
    try {
      await todoRepository.updateSingleField(
        todoId,
        'isCompleted',
        isCompleted,
      );

      // todos listesini güncelle
      final index = todos.indexWhere((todo) => todo.todoId == todoId);
      if (index != -1) {
        final updatedTodo = todos[index].copyWith(
          isCompleted: isCompleted as bool,
        );
        todos[index] = updatedTodo;
      }
    } catch (e) {
      // Hata yönetimi
      if (kDebugMode) {
        print('Error updating checkbox: $e');
      }
    }
  }

  @override
  void onClose() {
    updateTitleController.dispose();
    updateDescriptionController.dispose();
    super.onClose();
  }

  // Remove a `todo` record.
  Future<void> removeTodoRecord(String todoId) async {
    try {
      await todoRepository.removeTodoRecord(todoId);
      todos.removeWhere((t) => t.todoId == todoId);
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Silme Hatası',
        message: 'Todo silinirken bir hata oluştu.',
      );
    }
  }

  // Delete `todo` Warning
  void removeTodoWarningPopup(String todoId) {
    Get.defaultDialog<void>(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Todo Sil',
      middleText:
          // ignore: lines_longer_than_80_chars
          'Todonuzu kalıcı olarak silmek istediğinizden emin misiniz? Bu işlem geri alınamaz ve tüm verileriniz kalıcı olarak kaldırılır.',
      confirm: ElevatedButton(
        onPressed: () async {
          unawaited(removeTodoRecord(todoId));
          Navigator.of(Get.overlayContext!).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,
          side: const BorderSide(color: AppColors.error),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Sil'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('İptal'),
      ),
    );
  }
}
