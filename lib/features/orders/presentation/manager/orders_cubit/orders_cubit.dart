import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/features/orders/domain/repo/orders_repo.dart';

import '../../../domain/entites/orders_entity.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;
  int ordersCount = 0;

  Future<void> getOrders() async {
    emit(OrdersLoading());
    final result = await ordersRepo.getOrders();
    result.fold(
      (failure) => emit(OrdersFailure(errorMessage: failure.message)),
      (ordersEntityList) {
        ordersCount = ordersEntityList.length;
        emit(OrdersLoaded(ordersEntityList: ordersEntityList));
      },
    );
  }
}
