import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  final String title, subtitle, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: const Color(0xFF949D9E)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyle.semiBold13),

                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: AppTextStyle.regular13,
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppTextStyle.bold13.copyWith(
                    color: AppColor.lightPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 13),
            ],
          ),
        ),
      ),
    );
  }
}
