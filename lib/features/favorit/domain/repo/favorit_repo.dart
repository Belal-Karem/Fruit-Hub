import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/features/favorit/domain/entites/favorit_entity.dart';

abstract class FavoritRepo {
  Future<Either<Failure, void>> addFavorit({
    required FavoritEntity favoritEntity,
  });
  Future<Either<Failure, List<FavoritEntity>>> getFavorit();
}
