import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

class OrderReviewsection extends StatelessWidget {
  const OrderReviewsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ملخص الطلب :', style: AppTextStyle.bold13),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: AppTextStyle.regular13.copyWith(
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                  const Spacer(),
                  Text('150 جنيه', style: AppTextStyle.semiBold16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
