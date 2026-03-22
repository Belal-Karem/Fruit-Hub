import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/exception.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/core/services/data_base_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImle extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImle({
    required this.dataBaseService,
    required this.firebaseAuthService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserDate(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImle.createUserWithEmailAndPassword ${e.toString()}',
      );
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImle.signInWithEmailAndPassword ${e.toString()}',
      );
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user.user!));
    } on CustomException catch (e) {
      log('Exception in AuthRepoImle.signInWithGoogle ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user.user!));
    } on CustomException catch (e) {
      log('Exception in AuthRepoImle.signInWithFacebook ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }

  @override
  Future addUserDate({required UserEntity user}) async {
    await dataBaseService.addDtata(
      path: BackendEndpoint.addUserdata,
      data: user.toMap(),
    );
  }
}
