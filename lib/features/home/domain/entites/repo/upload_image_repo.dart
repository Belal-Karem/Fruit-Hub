import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failures.dart';

abstract class UploadImageRepo {
  Future<Either<Failure, String>> uploadImage({required String path});
}
