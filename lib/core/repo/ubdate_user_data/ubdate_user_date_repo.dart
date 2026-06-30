import 'package:dartz/dartz.dart';

import '../../../features/auth/domain/entity/user_entity.dart';
import '../../error/failures.dart';

abstract class UbdateUserDataRepo {
  Future<Either<Failure, void>> ubdateUserData({
    required UserEntity user,
    required String uId,
  });
  Future<Either<Failure, void>> saveUserData({required UserEntity user});

  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Either<Failure, void>> updateEmail({
    required String currentPassword,
    required String email,
  });
}
