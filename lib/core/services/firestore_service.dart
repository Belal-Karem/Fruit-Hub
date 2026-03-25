import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';
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

  @override
  Future<UserEntity> getData({
    required String path,
    required String uId,
  }) async {
    try {
      var data = await firestore.collection(path).doc(uId).get();
      return UserModel.fromJson(data.data() as Map<String, dynamic>);
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
}
