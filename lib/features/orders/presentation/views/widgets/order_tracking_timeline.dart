import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/orders/domain/entites/order_tracking_entity.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_timeline_item.dart';

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

class OrderTimelineListView extends StatelessWidget {
  const OrderTimelineListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orderTrackingList.length,
      separatorBuilder: (context, index) => CustomDivider(),
      itemBuilder: (context, index) {
        return OrderTimelineItem(orderTrackingEntity: orderTrackingList[index]);
      },
    );
  }
}
