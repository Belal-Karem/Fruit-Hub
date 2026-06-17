import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/in_active_payment_method.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/order_review_Item.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class PaymentSummryWidget extends StatelessWidget {
  const PaymentSummryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderReviewItem(
      title: 'يرجي تأكيد  طلبك :',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'وسيلة الدفع',
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
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '**** **** **** 6522',
                style: AppTextStyle.regular16.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const SizedBox(width: 26),
              InActivePaymentMethod(imagePath: Assets.imagesVisa),
            ],
          ),
        ],
      ),
    );
  }
}
