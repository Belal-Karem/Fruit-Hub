import 'package:fruit_hub/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  String? paymentMethod;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddressEntity = ShippingAddressEntity();

  OrderEntity(
    this.cartEntity, {
    this.paymentMethod,
    this.payWithCash,
    required this.uId,
  });
}
