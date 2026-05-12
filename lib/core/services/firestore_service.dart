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
    String? docId,
  }) async {
    try {
      if (docId != null) {
        await firestore.collection(path).doc(docId).set(data);
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
  Future<dynamic> getData({required String path, String? docId}) async {
    try {
      if (docId != null) {
        var data = await firestore.collection(path).doc(docId).get();
        return data.data() as Map<String, dynamic>;
      } else {
        var data = await firestore.collection(path).get();
        return data.docs.map((e) => e.data()).toList();
      }
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
    required String docId,
  }) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
