import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/theme/app_text_style.dart';
import '../../../domain/entites/product_info_cards_entity.dart';

class ProductInfoItem extends StatelessWidget {
  const ProductInfoItem({super.key, required this.productInfo});

  final ProductInfoCardsEntity productInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFFF1F1F5)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                productInfo.title,
                style: AppTextStyle.bold16.copyWith(
                  color: const Color(0xFF23AA49),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                productInfo.supTitle,
                style: AppTextStyle.semiBold13.copyWith(
                  color: const Color(0xFF969899),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(productInfo.imagePath),
        ],
      ),
    );
  }
}
