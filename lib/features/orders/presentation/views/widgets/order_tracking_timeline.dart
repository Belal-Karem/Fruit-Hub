import 'package:flutter/material.dart';

import 'package:fruit_hub/features/orders/presentation/views/widgets/order_timeline_list_view.dart';

import '../../../../../core/utils/app_decorations.dart';

class OrderTrackingTimeline extends StatelessWidget {
  const OrderTrackingTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: AppDecorations.grayBoxDecoration,
      child: Expanded(child: OrderTimelineListView()),
    );
  }
}
