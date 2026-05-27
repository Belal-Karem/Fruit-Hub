import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/best_selling_fruit/presentation/views/best_selling_view.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/theme/app_text_style.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.productslength});

  final int productslength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$productslength نتائج', style: AppTextStyle.bold16),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, BestSellingView.routeName),
          child: Container(
            width: 44,
            height: 31,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x66CACECE), width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(Assets.imagesArrowSwapHorizontalIcon),
          ),
        ),
      ],
    );
  }
}
