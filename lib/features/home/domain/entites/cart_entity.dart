import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  bool isExist(ProductEntity product) {
    for (var item in cartItems) {
      if (item.productEntity == product) {
        return true;
      }
    }
    return false;
  }
}
