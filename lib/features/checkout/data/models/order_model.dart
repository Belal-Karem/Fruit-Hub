import 'package:fruit_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruit_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

import '../../../../core/helper_functions/generate_order_number.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final String paymentMethod;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProductModelList;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.paymentMethod,
    required this.shippingAddressModel,
    required this.orderProductModelList,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      totalPrice: entity.cartEntity.calculatedTotalPrice(),
      uId: entity.uId,
      paymentMethod: entity.paymentMethod!,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        entity.shippingAddressEntity!,
      ),
      orderProductModelList: entity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'orderNumber': generateOrderNumber(),
    'paymentMethod': paymentMethod,
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProductModelList': orderProductModelList
        .map((e) => e.toJson())
        .toList(),
  };
}
