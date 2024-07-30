import 'dart:async';

import 'package:anytime_todo_app/core/repositories/user/user_repository.dart';
import 'package:anytime_todo_app/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/firebase_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/format_exceptions.dart';
import 'package:anytime_todo_app/core/utils/exceptions/platform_exceptions.dart';
import 'package:anytime_todo_app/ui/auth/login/login_screen.dart';
import 'package:anytime_todo_app/ui/auth/signup/verify_email.dart';
import 'package:anytime_todo_app/ui/home/home_screen.dart';
import 'package:anytime_todo_app/ui/onboard/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  // Function to Show Relevant Screen
  Future<void> screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        // Get.offAll(() => const NavigationMenu());
        unawaited(Get.offAll(() => const HomeScreen()));
      } else {
        unawaited(
          Get.offAll(
            () => VerifyEmailScreen(email: _auth.currentUser?.email),
          ),
        );
      }
    } else {
      // Local Storage
      await deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      unawaited(
        deviceStorage.read<bool>('IsFirstTime') != true
            ? Get.offAll(
                () => const LoginScreen(),
              ) // Redirect to Login Screen if not the first time
            : Get.offAll(() => const OnboardingScreen()),
      ); // Redirect to Onboarding Screen if it's the first time
    }
  }

  /* ----------------------- Email & Password sign-in ----------------------- */
  /// EmailAuthentication - LOGIN
  Future<UserCredential> loginWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Bir şeyler yanlış gitti. Lütfen tekrar deneyin.');
    }
  }

  /// EmailAuthentication - Register
  Future<UserCredential> registerWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Bir şeyler yanlış gitti. Lütfen tekrar deneyin.');
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
      throw const TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Bir şeyler yanlış gitti. Lütfen tekrar deneyin.');
    }
  }

  // [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Bir şeyler yanlış gitti. Lütfen tekrar deneyin.');
    }
  }

  // [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      unawaited(Get.offAll(() => const LoginScreen()));
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Bir şeyler yanlış gitti. Lütfen tekrar deneyin.');
    }
  }

  // [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      // Create a credential
      final credential =
          EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Bir şeyler yanlış gitti. Lütfen tekrar deneyin.');
    }
  }

  // [DeleteUser] - Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception('Bir şeyler yanlış gitti. Lütfen tekrar deneyin.');
    }
  }
}
