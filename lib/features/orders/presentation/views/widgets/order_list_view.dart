import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_item.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: OrderItem(),
        );
      },
    );
  }
}
