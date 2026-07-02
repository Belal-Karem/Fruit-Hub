import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_item.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_tracking_timeline.dart';

class OrderTrackingViewBody extends StatelessWidget {
  const OrderTrackingViewBody({super.key});

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
          OrderItem(),
          const SizedBox(height: 19),
          Expanded(child: OrderTrackingTimeline()),
        ],
      ),
    );
  }
}
