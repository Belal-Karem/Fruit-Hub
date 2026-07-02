import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/domain/entites/order_tracking_entity.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/custom_orders_icon.dart';

import '../../../../../core/utils/theme/app_text_style.dart';

class OrderTimelineItem extends StatelessWidget {
  const OrderTimelineItem({super.key, required this.orderTrackingEntity});

  final OrderTrackingEntity orderTrackingEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomOrdersIcon(
          color: orderTrackingEntity.isCompleted
              ? const Color(0xFFEBF9F1)
              : const Color(0xFFF5F5F5),
          iconPath: orderTrackingEntity.icon,
        ),
        const SizedBox(width: 24),
        Column(
          children: [
            Text(orderTrackingEntity.title, style: AppTextStyle.bold13),
            const SizedBox(height: 4),
            Text(
              orderTrackingEntity.date.toString(),
              style: AppTextStyle.regular11,
            ),
          ],
        ),
      ],
    );
  }
}
