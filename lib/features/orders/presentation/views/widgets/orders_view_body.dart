import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          buildAppBar(
            context: context,
            title: 'طلباتي',
            showNotification: false,
          ),
          Expanded(child: OrderListView()),
        ],
      ),
    );
  }
}
