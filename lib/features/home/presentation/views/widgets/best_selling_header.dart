import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الأكثر مبيعًا', style: AppTextStyle.bold16),
        Text('المزيد', style: AppTextStyle.regular13),
      ],
    );
  }
}
