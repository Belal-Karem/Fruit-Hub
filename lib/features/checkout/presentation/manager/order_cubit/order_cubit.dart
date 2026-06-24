import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

part 'order_state.dart';

class AddOrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;
  AddOrderCubit(this.orderRepo) : super(OrderInitial());

  void addOrder(OrderEntity orderEntity) async {
    emit(OrderLoading());
    var result = await orderRepo.addOrder(orderEntity: orderEntity);
    result.fold((failure) => emit(OrderFailure(failure.message)), (_) {
      emit(OrderSuccess());
    });
  }
}
