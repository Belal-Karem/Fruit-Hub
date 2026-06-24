import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrderRepo orderRepo;
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());

  void addOrder(OrderEntity orderEntity) async {
    emit(AddOrderLoading());
    var result = await orderRepo.addOrder(orderEntity: orderEntity);
    result.fold((failure) => emit(AddOrderFailure(failure.message)), (_) {
      emit(AddOrderSuccess());
    });
  }
}
