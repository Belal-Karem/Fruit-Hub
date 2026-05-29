import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);
  void addCartItem(CartItemEntity cartItemEntity) {
    cartEntity.addCartItem(cartItemEntity);
    emit(CartItemadded());
  }
}
