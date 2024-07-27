import 'package:anytime_todo_app/core/models/user/user_model.dart';
import 'package:anytime_todo_app/core/utils/exceptions/firebase_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/format_exceptions.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("User").doc(user.userId).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }
}
