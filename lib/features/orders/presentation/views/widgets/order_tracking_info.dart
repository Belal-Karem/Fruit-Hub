import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/custom_orders_icon.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/orders_info_section.dart';

import '../../../../../core/utils/app_decorations.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../domain/entites/orders_entity.dart';

class OrderTrackingInfo extends StatelessWidget {
  const OrderTrackingInfo({super.key, required this.order});
  final OrdersEntity order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 19),
      decoration: AppDecorations.grayBoxDecoration,
      child: Row(
        children: [
          CustomOrdersIcon(iconPath: Assets.imagesOrdersIcon),
          const SizedBox(width: 16),
          OrdersInfoSection(orders: order),
        ],
      ),
    );
  }
}
