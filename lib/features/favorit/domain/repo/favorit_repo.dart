import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/error/failures.dart';

abstract class FavoritRepo {
  Future<Either<Failure, void>> addFavorit({
    required ProductEntity productEntity,
  });
  Future<Either<Failure, List<ProductEntity>>> getFavorit();
}
