import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/core/models/products_model/product_model.dart';
import 'package:fruit_hub/core/repo/prodcts_repo/products_repo.dart';
import 'package:fruit_hub/core/services/data_base_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';

import '../../error/exception.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DataBaseService dataBaseService;
  ProductsRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await dataBaseService.getData(path: BackendEndpoint.getProducts)
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

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data =
          await dataBaseService.getData(
                path: BackendEndpoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
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
      log('Exception in ProductsRepoImpl.getBestSellingProduct${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in ProductsRepoImpl.getBestSellingProduct ${e.toString()}',
      );
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }
}
