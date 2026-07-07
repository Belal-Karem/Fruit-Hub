import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/error/exception.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/core/models/products_model/product_model.dart';
import 'package:fruit_hub/core/services/data_base_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/favorit/domain/repo/favorit_repo.dart';

import '../../../../core/helper_functions/get_user.dart';

class FavoritRepoImpl implements FavoritRepo {
  final DataBaseService dataBaseService;

  FavoritRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addFavorit({
    required ProductEntity productEntity,
  }) async {
    try {
      await dataBaseService.addDtata(
        path: BackendEndpoint.addFavorit,
        data: ProductModel.fromEntity(productEntity).tojson(),
      );
      return right(null);
    } on CustomException catch (e) {
      log('Exception in ProductsRepoImpl.getProducts ${e.toString()}');
      return left(ServerFailure(e.toString()));
    } catch (e) {
      log('Exception in ProductsRepoImpl.getProducts ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorit() async {
    try {
      var data =
          await dataBaseService.getData(
                path: BackendEndpoint.getFavorit,
                // whereField: 'uId',
                // whereValue: getUserData().uId,
              )
              as List<Map<String, dynamic>>;
      List<ProductModel> products = data
          .map((e) => ProductModel.fromJson(e))
          .toList();

      List<ProductEntity> productEntities = products
          .map((e) => e.toEntity())
          .toList();

      return right(productEntities);
    } on CustomException catch (e) {
      log('Exception in ProductsRepoImpl.getProducts ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in ProductsRepoImpl.getProducts ${e.toString()}');
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }
}
