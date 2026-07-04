import '../../../checkout/data/models/order_product_model.dart';

class OrdersEntity {
  final String date;
  final String orderNumber;
  final String status;
  final String totalPrice;
  final String uId;
  final List<OrderProductModel> orderProductModelList;

  OrdersEntity({
    required this.date,
    required this.orderNumber,
    required this.status,
    required this.totalPrice,
    required this.uId,
    required this.orderProductModelList,
  });
}
