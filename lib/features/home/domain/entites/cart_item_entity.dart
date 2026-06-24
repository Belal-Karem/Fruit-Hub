import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculatedtotalPrice() {
    return productEntity.price * quantity;
  }

  num calculatedTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  increaseQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    quantity--;
  }

  @override
  List<Object?> get props => [productEntity];
}
