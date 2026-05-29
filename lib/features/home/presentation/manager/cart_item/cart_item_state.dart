part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();
}

final class CartItemInitial extends CartItemState {}

final class CartItemUbdated extends CartItemState {
  final CartItemEntity cartItemEntity;

  const CartItemUbdated(this.cartItemEntity);
}
