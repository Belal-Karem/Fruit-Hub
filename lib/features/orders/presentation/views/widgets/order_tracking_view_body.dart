import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_tracking_info.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_tracking_timeline.dart';

import '../../../domain/entites/orders_entity.dart';

class OrderTrackingViewBody extends StatelessWidget {
  const OrderTrackingViewBody({super.key, required this.order});

  final OrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          buildAppBar(
            context: context,
            title: 'تتبع الطلب',
            showNotification: false,
          ),
          OrderTrackingInfo(order: order),
          const SizedBox(height: 19),
          Expanded(child: OrderTrackingTimeline()),
        ],
      ),
    );
  }
}
