import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/repo/ubdate_user_data/ubdate_user_date_repo.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';

import '../../../features/auth/data/models/user_model.dart';
import '../../../features/auth/domain/entity/user_entity.dart';
import '../../error/exception.dart';
import '../../error/failures.dart';
import '../../services/data_base_service.dart';
import '../../services/shared_preferences _singleton.dart';
import '../../utils/backend_endpoint.dart';

class UpdateUserDataRepoImpl implements UpdateUserDataRepo {
  final DataBaseService dataBaseService;
  final FirebaseAuthService firebaseAuthService;

  UpdateUserDataRepoImpl({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });

  @override
  Future<Either<Failure, void>> updateUserData({
    required UserEntity user,
  }) async {
    try {
      final data = UserModel.fromEntity(user).toUpdateMap();
      await dataBaseService.updateDtata(
        path: BackendEndpoint.ubdateUserData,
        data: data,
        docId: user.uId!,
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

  @override
  Future<Either<Failure, void>> updateEmail({
    required String currentPassword,
    required String email,
  }) async {
    try {
      firebaseAuthService.updateEmail(
        currentPassword: currentPassword,
        email: email,
      );
      return const Right(null);
    } on CustomException catch (e) {
      log('Exception in AuthRepoImle.updateEmail ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImle.updateEmail ${e.toString()}');
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      firebaseAuthService.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return const Right(null);
    } on CustomException catch (e) {
      log('Exception in AuthRepoImle.updatePassword ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImle.updatePassword ${e.toString()}');
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }
}
