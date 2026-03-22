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
  }) async {
    try {
      await firestore.collection(path).add(data);
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
}
