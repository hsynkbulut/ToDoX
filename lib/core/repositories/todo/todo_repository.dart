import 'package:anytime_todo_app/core/models/todo/todo_model.dart';
import 'package:anytime_todo_app/core/utils/exceptions/firebase_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/format_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Repository class for todo-related operations.
class TodoRepository extends GetxController {
  static TodoRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save a todo record to Firestore.
  Future<void> saveTodoRecord(TodoModel todo) async {
    try {
      await _db.collection("Todos").doc(todo.todoId).set(todo.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  // Function to fetch a todo record based on todo ID.
  Future<TodoModel> fetchTodoDetails(String todoId) async {
    try {
      final documentSnapshot = await _db.collection("Todos").doc(todoId).get();
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data();
        if (data != null) {
          return TodoModel.fromJson(data);
        }
      }
      throw 'Todo not found';
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  // Function to fetch all todos for a specific user ID.
  Future<List<TodoModel>> fetchTodosByUserId(String userId) async {
    try {
      final querySnapshot = await _db
          .collection("Todos")
          .where('userId', isEqualTo: userId)
          .get();
      return querySnapshot.docs
          .map((doc) => TodoModel.fromJson(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  // Function to update a todo record in Firestore.
  Future<void> updateTodoDetails(TodoModel updatedTodo) async {
    try {
      await _db
          .collection("Todos")
          .doc(updatedTodo.todoId)
          .update(updatedTodo.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  Future<void> updateSingleField(
      String todoId, String field, dynamic newValue) async {
    try {
      await _db.collection('Todos').doc(todoId).update({field: newValue});
    } catch (e) {
      throw Exception('Field güncellenirken hata oluştu: $e');
    }
  }

  // Function to delete a todo record from Firestore.
  Future<void> removeTodoRecord(String todoId) async {
    try {
      await _db.collection("Todos").doc(todoId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }
}
