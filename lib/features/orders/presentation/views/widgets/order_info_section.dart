import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_num_and_price.dart';

import '../../../../../core/utils/theme/app_text_style.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('طلب رقم: 1234567#', style: AppTextStyle.bold13),
        Text('تم الطلب :22 مارس ,2024', style: AppTextStyle.regular11),
        const SizedBox(height: 8),
        OrderNumAndPrice(),
      ],
    );
  }
}
