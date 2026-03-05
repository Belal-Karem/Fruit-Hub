import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImle extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
