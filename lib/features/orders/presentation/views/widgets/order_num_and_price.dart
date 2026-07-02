import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_text_style.dart';

class OrderNumAndPrice extends StatelessWidget {
  const OrderNumAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'عدد الطلبات:', style: AppTextStyle.regular13),
          TextSpan(text: '10', style: AppTextStyle.bold13),
          TextSpan(text: '\t  250 جنية', style: AppTextStyle.bold13),
        ],
      ),
    );
  }
}
