import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity(CartItemEntity entity) {
    return OrderProductModel(
      name: entity.productEntity.name,
      imageUrl: entity.productEntity.imageUrl!,
      price: entity.productEntity.price.toDouble(),
      quantity: entity.quantity,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'imageUrl': imageUrl,
    'price': price,
    'quantity': quantity,
  };
}
