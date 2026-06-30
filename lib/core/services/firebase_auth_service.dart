import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/error/exception.dart';

class FirebaseAuthService {
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور المقدمة ضعيفة للغاية.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('الحساب موجود بالفعل لهذا البريد الإلكتروني.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException('الإيميل أو كلمة المرور غير صحيحة.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('تحقق من الاتصال بالانترنت');
      } else {
        throw CustomException('حدث خطأ. يرجى المحاولة مرة أخرى لاحقاً.');
      }
    } on PlatformException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword${e.toString()}',
      );
      if (e.code == 'ERROR_INVALID_EMAIL') {
        throw CustomException('الإيميل أو كلمة المرور غير صحيحة.');
      } else if (e.code == 'ERROR_INVALID_CREDENTIAL') {
        throw CustomException('البريد الإلكتروني غير صحيح');
      } else if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        throw CustomException('البريد الإلكتروني مستخدم بالفعل');
      } else {
        throw CustomException('خطأ في الإدخال');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword${e.toString()} ',
      );
      throw CustomException('حدث خطأ. يرجى المحاولة مرة أخرى لاحقاً.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword${e.toString()} and code is ${e.code} ',
      );
      if (e.code == 'user-not-found') {
        throw CustomException('لا يوجد حساب بهذا البريد الإلكتروني.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException('الإيميل أو كلمة المرور غير صحيحة.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('تحقق من الاتصال بالانترنت');
      } else {
        throw CustomException('حدث خطاء. يرجى المحاولة مرة اخرى لاحقا.');
      }
    } on PlatformException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword${e.toString()}',
      );
      if (e.code == 'ERROR_INVALID_EMAIL') {
        throw CustomException('الإيميل أو كلمة المرور غير صحيحة.');
      } else if (e.code == 'ERROR_INVALID_CREDENTIAL') {
        throw CustomException('البريد الإلكتروني غير صحيح');
      } else {
        throw CustomException('خطأ في الإدخال');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword${e.toString()} ',
      );
      throw CustomException('حدث خطاء. يرجى المحاولة مرة اخرى لاحقا.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    return userCredential.user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    );
    return userCredential.user!;
  }

  static bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        log('Exception in FirebaseAuthService.changePassword ${e.toString()}');
        throw CustomException('يرجى تسجيل الدخول مرة اخرى');
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        throw CustomException('كلمة المرور غير صحيحة');
      } else {
        throw CustomException('حدث خطاء. يرجى المحاولة مرة اخرى لاحقا.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.changePassword ${e.toString()}');
      throw CustomException('حدث خطاء. يرجى المحاولة مرة اخرى لاحقا.');
    }
  }

  Future<void> changeEmail({
    required String currentPassword,
    required String email,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.verifyBeforeUpdateEmail(email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        log('Exception in FirebaseAuthService.changeEmail ${e.toString()}');
        throw CustomException('يرجى تسجيل الدخول مرة اخرى');
      } else if (e.code == 'invalid-credential') {
        throw CustomException('كلمة المرور غير صحيحة');
      } else {
        throw CustomException('حدث خطاء. يرجى المحاولة مرة اخرى لاحقا.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.changeEmail ${e.toString()}');
      throw CustomException('حدث خطاء. يرجى المحاولة مرة اخرى لاحقا.');
    }
  }
}
