import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/orders/domain/entites/orders_entity.dart';

import '../../../../core/error/failures.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrdersEntity>>> getOrders();
}
