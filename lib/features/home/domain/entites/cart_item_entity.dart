import 'package:fruit_hub/core/entites/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculatedtotalPrice() {
    return productEntity.price * count;
  }

  num calculatedTotalWeight() {
    return productEntity.unitAmount * count;
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    count--;
  }
}
