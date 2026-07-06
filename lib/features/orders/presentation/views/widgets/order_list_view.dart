import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/domain/entites/orders_entity.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_item.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key, required this.orders});

  final List<OrdersEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: OrderItem(orders: orders[index]),
        );
      },
    );
  }
}
