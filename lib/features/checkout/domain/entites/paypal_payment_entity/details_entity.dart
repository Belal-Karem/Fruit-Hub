import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };

  factory DetailsEntity.fromEntity(OrderEntity orderEntity) {
    return DetailsEntity(
      subtotal: orderEntity.cartEntity.calculatedTotalPrice().toString(),
      shipping: orderEntity.calculatedShippingCost().toString(),
      shippingDiscount: orderEntity.calculatedShippingDiscount(),
    );
  }
}
