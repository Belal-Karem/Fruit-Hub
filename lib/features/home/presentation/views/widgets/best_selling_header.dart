import 'package:flutter/material.dart';
import 'package:fruit_hub/features/best_selling_fruit/presentation/views/best_selling_view.dart';

import '../../../../../core/utils/theme/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الأكثر مبيعًا', style: AppTextStyle.bold16),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, BestSellingView.routeName),
          child: Text('المزيد', style: AppTextStyle.regular13),
        ),
      ],
    );
  }
}
