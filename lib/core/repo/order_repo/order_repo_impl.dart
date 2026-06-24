import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/core/services/data_base_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/checkout/data/models/order_model.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

import '../../error/exception.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final DataBaseService dataBaseService;
  OrderRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      dataBaseService.addDtata(
        path: BackendEndpoint.addOrder,
        data: OrderModel.fromEntity(orderEntity).toJson(),
      );
      return right(null);
    } on CustomException catch (e) {
      log('Exception in OrderRepoImpl.addOrder ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in OrderRepoImpl.addOrder ${e.toString()}');
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }
}
