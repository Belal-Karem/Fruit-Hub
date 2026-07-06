class OrdersEntity {
  final String date;
  final String orderNumber;
  final String status;
  final double totalPrice;
  final String uId;
  final List<dynamic> orderProductModelList;

  OrdersEntity({
    required this.date,
    required this.orderNumber,
    required this.status,
    required this.totalPrice,
    required this.uId,
    required this.orderProductModelList,
  });
}
