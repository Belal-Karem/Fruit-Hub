import '../../../checkout/data/models/order_product_model.dart';
import '../../domain/entites/orders_entity.dart';

class OrdersModel {
  final String date;
  final String orderNumber;
  final String status;
  final String totalPrice;
  final String uId;
  final List<OrderProductModel> orderProductModelList;

  OrdersModel({
    required this.date,
    required this.orderNumber,
    required this.status,
    required this.totalPrice,
    required this.uId,
    required this.orderProductModelList,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    date: json['date'],
    orderNumber: json['orderNumber'],
    status: json['status'],
    totalPrice: json['totalPrice'],
    uId: json['uId'],
    orderProductModelList: json['orderProductModelList'],
  );

  OrdersEntity toEntity() {
    return OrdersEntity(
      date: date,
      orderNumber: orderNumber,
      status: status,
      totalPrice: totalPrice,
      uId: uId,
      orderProductModelList: orderProductModelList,
    );
  }
}
