import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/orders_info_section.dart';

class OrderInfoListView extends StatelessWidget {
  const OrderInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return OrdersInfoSection();
      },
    );
  }
}
