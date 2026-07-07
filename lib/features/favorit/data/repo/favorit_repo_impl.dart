import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/exception.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/core/services/data_base_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/favorit/data/models/favorit_model.dart';
import 'package:fruit_hub/features/favorit/domain/entites/favorit_entity.dart';
import 'package:fruit_hub/features/favorit/domain/repo/favorit_repo.dart';

import '../../../../core/helper_functions/get_user.dart';

class FavoritRepoImpl implements FavoritRepo {
  final DataBaseService dataBaseService;

  FavoritRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addFavorit({
    required FavoritEntity favoritEntity,
  }) async {
    try {
      await dataBaseService.addDtata(
        path: BackendEndpoint.addFavorit,
        data: FavoritModel.fromEntity(favoritEntity).tojson(),
      );
      return right(null);
    } on CustomException catch (e) {
      log('Exception in ProductsRepoImpl.addFavorit ${e.toString()}');
      return left(ServerFailure(e.toString()));
    } catch (e) {
      log('Exception in ProductsRepoImpl.addFavorit ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FavoritEntity>>> getFavorit() async {
    try {
      var data =
          await dataBaseService.getData(
                path: BackendEndpoint.getFavorit,
                whereField: 'uId',
                whereValue: getUserData().uId,
              )
              as List<Map<String, dynamic>>;
      List<FavoritModel> favorit = data
          .map((e) => FavoritModel.fromJson(e))
          .toList();

      List<FavoritEntity> favoritEntities = favorit
          .map((e) => e.toEntity())
          .toList();
      return right(favoritEntities);
    } on CustomException catch (e) {
      log('Exception in ProductsRepoImpl.getFavorit ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in ProductsRepoImpl.getFavorit ${e.toString()}');
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }
}
