import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/order_review_Item.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var totalPrice = context
        .read<OrderEntity>()
        .cartEntity
        .calculatedTotalPrice();
    return OrderReviewItem(
      title: 'ملخص الطلب :',
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
              Text(
                '$totalPrice جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyle.semiBold16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: AppTextStyle.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Text(
                  '30جنية',
                  textAlign: TextAlign.right,
                  style: AppTextStyle.semiBold13.copyWith(
                    color: const Color(0xFF4E5556),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            indent: 40,
            endIndent: 40,
            thickness: 0.50,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('الكلي', style: AppTextStyle.bold16),
              const Spacer(),
              Text('${totalPrice + 30} جنيه', style: AppTextStyle.bold16),
            ],
          ),
        ],
      ),
    );
  }
}
