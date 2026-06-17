import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/order_review_Item.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class AddressSummrywidget extends StatelessWidget {
  const AddressSummrywidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderReviewItem(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'عنوان التوصيل',
                style: AppTextStyle.bold13.copyWith(color: Colors.black),
              ),
              const Spacer(),
              SvgPicture.asset(Assets.imagesEditChange),
              const SizedBox(width: 6),
              Text(
                'تعديل',
                style: AppTextStyle.semiBold13.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesLocationIcon),
              const SizedBox(width: 8),
              Text(
                'شارع النيل، مبنى رقم ١٢٣',
                textAlign: TextAlign.right,
                style: AppTextStyle.regular16.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
