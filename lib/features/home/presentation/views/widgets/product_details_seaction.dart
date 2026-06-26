import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/product_info_cards.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          // trailing: CartItemActionButtons(),
          title: Text('بطيخ', style: AppTextStyle.bold16),
          subtitle: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '20جنية ',
                  style: AppTextStyle.bold13.copyWith(
                    color: AppColor.secondaryColor,
                  ),
                ),
                TextSpan(
                  text: '/الكيلو',
                  style: AppTextStyle.semiBold13.copyWith(
                    color: const Color(0xFFF8C76D),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.star, color: const Color(0xffFFC529)),
            const SizedBox(width: 2.5),
            Text('4.5', style: AppTextStyle.semiBold13),
            const SizedBox(width: 9),
            Text('(+30)', style: AppTextStyle.regular13),
            const SizedBox(width: 9),
            Text(
              'المراجعه',
              style: AppTextStyle.bold13.copyWith(
                decoration: TextDecoration.underline,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
          style: AppTextStyle.regular13,
        ),
        const SizedBox(height: 16),
        ProductInfoCards(),
      ],
    );
  }
}
