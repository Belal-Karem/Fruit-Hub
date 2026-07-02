import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/orders_info_section.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/custom_orders_icon.dart';

import '../../../../../core/utils/app_decorations.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 19),
      decoration: AppDecorations.grayBoxDecoration,
      child: Row(
        children: [
          CustomOrdersIcon(iconPath: Assets.imagesOrdersIcon),
          const SizedBox(width: 16),
          OrdersInfoSection(),
        ],
      ),
    );
  }
}
