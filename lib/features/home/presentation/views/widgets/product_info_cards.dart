import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/product_info_cards_entity.dart';
import 'package:svg_flutter/svg.dart' show SvgPicture;

import '../../../../../core/utils/theme/app_text_style.dart';

class ProductInfoCards extends StatelessWidget {
  const ProductInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getProductInfoCards(context.read<ProductEntity>()).length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (context, index) {
        return ProductInfoItem(
          productInfo: getProductInfoCards(
            context.read<ProductEntity>(),
          )[index],
        );
      },
    );
  }
}

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
