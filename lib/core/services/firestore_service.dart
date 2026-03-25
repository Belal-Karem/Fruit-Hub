import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../error/exception.dart';
import 'data_base_service.dart';

class FirestoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addDtata({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  }) async {
    try {
      if (uId != null) {
        await firestore.collection(path).doc(uId).set(data);
      } else {
        await firestore.collection(path).add(data);
      }
    } on FirebaseException catch (e) {
      log(
        'Exception in FirestoreService.addDtata ${e.toString()} and code is ${e.code} ',
      );
      if (e.code == 'permission-denied') {
        throw CustomException('لا يمكنك الوصول لهذا الحقل');
      } else if (e.code == 'invalid-argument') {
        throw CustomException('لا يمكنك الوصول لهذا الحقل');
      } else if (e.code == 'unavailable') {
        throw CustomException('تأكد من الاتصال بالإنترنت');
      } else {
        throw CustomException('حدث خطاء غير متوقع');
      }
    } catch (e) {
      log('Exception in FirestoreService.addDtata ${e.toString()}');
      throw CustomException('حدث خطاء غير متوقع');
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  }) async {
    try {
      var data = await firestore.collection(path).doc(uId).get();
      return data.data() as Map<String, dynamic>;
    } on FirebaseException catch (e) {
      log(
        'Exception in FirestoreService.getData ${e.toString()} and code is ${e.code} ',
      );
      if (e.code == 'permission-denied') {
        throw CustomException('لا يمكنك الوصول لهذا الحقل');
      } else if (e.code == 'invalid-argument') {
        throw CustomException('لا يمكنك الوصول لهذا الحقل');
      } else if (e.code == 'unavailable') {
        throw CustomException('تأكد من الاتصال بالإنترنت');
      } else {
        throw CustomException('حدث خطاء غير متوقع');
      }
    } catch (e) {
      log('Exception in FirestoreService.getData ${e.toString()}');
      throw CustomException('حدث خطاء غير متوقع');
    }
  }

  @override
  Future<bool> checkIfDataExist({
    required String path,
    required String uId,
  }) async {
    var data = await firestore.collection(path).doc(uId).get();
    return data.exists;
  }
}
