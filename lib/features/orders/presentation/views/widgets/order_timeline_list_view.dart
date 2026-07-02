import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_timeline_item.dart';

import '../../../../../core/widgets/custom_divider.dart';
import '../../../domain/entites/order_tracking_entity.dart';

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
