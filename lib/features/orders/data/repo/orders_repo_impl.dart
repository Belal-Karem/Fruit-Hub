import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/core/helper_functions/get_user.dart';
import 'package:fruit_hub/core/services/data_base_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/orders/data/models/orders_model.dart';
import 'package:fruit_hub/features/orders/domain/repo/orders_repo.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entites/orders_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DataBaseService dataBaseService;
  OrdersRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, List<OrdersEntity>>> getOrders() async {
    try {
      var data =
          await dataBaseService.getData(
                path: BackendEndpoint.getOrder,
                whereField: 'uId',
                whereValue: getUserData().uId,
                orderBy: 'date',
              )
              as List<Map<String, dynamic>>;
      List<OrdersModel> orders = data
          .map((e) => OrdersModel.fromJson(e))
          .toList();
      List<OrdersEntity> orderEntities = orders
          .map((e) => e.toEntity())
          .toList();

      return right(orderEntities);
    } on CustomException catch (e) {
      log('Exception in OrdersRepoImpl.getOrders ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in OrdersRepoImpl.getOrders ${e.toString()}');
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }
}
