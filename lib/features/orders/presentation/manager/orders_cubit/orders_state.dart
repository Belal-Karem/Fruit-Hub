part of 'orders_cubit.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersLoaded extends OrdersState {
  final List<OrdersEntity> ordersEntityList;
  const OrdersLoaded({required this.ordersEntityList});
}

final class OrdersFailure extends OrdersState {
  final String errorMessage;
  const OrdersFailure({required this.errorMessage});
}
