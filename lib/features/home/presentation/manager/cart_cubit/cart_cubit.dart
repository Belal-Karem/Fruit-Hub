import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);
  void addCartItem(ProductEntity productEntity) {
    bool isproductExist = cartEntity.isExist(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isproductExist) {
      cartItem.increaseQuantity();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(CartProductAdded());
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
