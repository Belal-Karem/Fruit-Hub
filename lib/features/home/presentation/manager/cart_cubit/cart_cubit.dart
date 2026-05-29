import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);
  void addCartItem(ProductEntity productEntity) {
    bool isproductExist = cartEntity.isExist(productEntity);
    if (isproductExist) {
    } else {
      CartItemEntity cartItemEntity = CartItemEntity(
        productEntity: productEntity,
        count: 1,
      );
      cartEntity.addCartItem(cartItemEntity);
    }

    emit(CartItemadded());
  }
}
