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

  CartItemEntity getCartItem(ProductEntity product) {
    for (var item in cartItems) {
      if (item.productEntity == product) {
        return item;
      }
    }
    return CartItemEntity(productEntity: product, quantity: 1);
  }

  double calculatedTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.calculatedtotalPrice();
    }
    return totalPrice;
  }

  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }
}
