import 'package:anytime_todo_app/common/widgets/bottom_navbar/navigation_menu.dart';
import 'package:anytime_todo_app/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/firebase_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/format_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/platform_exceptions.dart';
import 'package:anytime_todo_app/ui/auth/login/login_screen.dart';
import 'package:anytime_todo_app/ui/auth/signup/verify_email.dart';
import 'package:anytime_todo_app/ui/onboard/onboarding_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  // Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() =>
              const LoginScreen()) // Redirect to Login Screen if not the first time
          : Get.offAll(() =>
              const OnboardingScreen()); // Redirect to Onboarding Screen if it's the first time
    }
  }

  /* ----------------------- Email & Password sign-in ----------------------- */
  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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

  // [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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

  // [ReAuthenticate] - ReAuthenticate User

  // [EmailAuthentication] - FORGET PASSWORD

  // [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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

  // [DeleteUser] - Remove user Auth and Firestore Account.
}
