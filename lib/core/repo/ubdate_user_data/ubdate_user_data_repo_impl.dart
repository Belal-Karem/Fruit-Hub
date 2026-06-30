import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/repo/ubdate_user_data/ubdate_user_date_repo.dart';

import '../../../features/auth/data/models/user_model.dart';
import '../../../features/auth/domain/entity/user_entity.dart';
import '../../error/exception.dart';
import '../../error/failures.dart';
import '../../services/data_base_service.dart';
import '../../services/shared_preferences _singleton.dart';
import '../../utils/backend_endpoint.dart';

class UbdateUserDataRepoImpl implements UbdateUserDataRepo {
  final DataBaseService dataBaseService;

  UbdateUserDataRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, void>> ubdateUserData({
    required UserEntity user,
    required String uId,
  }) async {
    try {
      final data = UserModel.fromEntity(user).toUpdateMap();
      await dataBaseService.updateDtata(
        path: BackendEndpoint.ubdateUserData,
        data: data,
        docId: uId,
      );
      saveUserData(user: user);
      return right(null);
    } on CustomException catch (e) {
      log('Exception in AuthRepoImle.updateUserData ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImle.updateUserData ${e.toString()}');
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }

  Future<Either<Failure, void>> saveUserData({required UserEntity user}) async {
    try {
      var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
      await Prefs.setString(BackendEndpoint.kUserData, jsonData);
      return right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
