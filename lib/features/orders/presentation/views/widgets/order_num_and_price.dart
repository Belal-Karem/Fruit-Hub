import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_text_style.dart';
import '../../../domain/entites/orders_entity.dart';

class OrderNumAndPrice extends StatelessWidget {
  const OrderNumAndPrice({super.key, required this.orders});

  final OrdersEntity orders;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'عدد الطلبات:', style: AppTextStyle.regular13),
          TextSpan(
            text: orders.orderProductModelList.length.toString(),
            style: AppTextStyle.bold13,
          ),
          TextSpan(
            text: '\t  ${orders.totalPrice} جنية',
            style: AppTextStyle.bold13,
          ),
        ],
      ),
    );
  }
}
