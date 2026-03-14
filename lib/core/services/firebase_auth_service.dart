import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/error/exception.dart';

class FirebaseAuthService {
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
      } else if (e.code == 'network-request-failed') {
        throw CustomException('network it,s failed');
      } else {
        throw CustomException('حدث خطأ. يرجى المحاولة مرة أخرى لاحقاً.');
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
      } else if (e.code == 'network-request-failed') {
        throw CustomException('تحقق من الاتصال بالانترنت');
      } else {
        throw CustomException('حدث خطاء. يرجى المحاولة مرة اخرى لاحقا.');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword${e.toString()} ',
      );
      throw CustomException('حدث خطاء. يرجى المحاولة مرة اخرى لاحقا.');
    }
  }
}
