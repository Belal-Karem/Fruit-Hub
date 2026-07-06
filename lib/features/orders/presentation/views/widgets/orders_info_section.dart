import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_num_and_price.dart';

import '../../../../../core/utils/theme/app_text_style.dart';
import '../../../domain/entites/orders_entity.dart';

class OrdersInfoSection extends StatelessWidget {
  const OrdersInfoSection({super.key, required this.orders});

  final OrdersEntity orders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('طلب رقم: ${orders.orderNumber}#', style: AppTextStyle.bold13),
        Text('تم الطلب :  ${orders.date}', style: AppTextStyle.regular11),
        const SizedBox(height: 8),
        OrderNumAndPrice(orders: orders),
      ],
    );
  }
}
