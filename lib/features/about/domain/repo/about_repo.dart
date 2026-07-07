import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/features/about/domain/entites/about_entity.dart';

abstract class AboutRepo {
  Future<Either<Failure, AboutEntity>> getAbout();
}
