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
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور المقدمة ضعيفة للغاية.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('الحساب موجود بالفعل لهذا البريد الإلكتروني.');
      } else {
        throw CustomException('حدث خطأ. يرجى المحاولة مرة أخرى لاحقاً.');
      }
    } catch (e) {
      throw CustomException('حدث خطأ. يرجى المحاولة مرة أخرى لاحقاً.');
    }
  }
}
