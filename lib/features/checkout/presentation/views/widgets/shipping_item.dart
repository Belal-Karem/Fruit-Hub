import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/in_active_shipping_item_dot.dart';

import 'active_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isSelected,
    this.onTap,
  });

  final String title, subtitle, price;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: isSelected
                ? BorderSide(width: 1.5, color: AppColor.primaryColor)
                : BorderSide.none,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSelected
                    ? const ActiveShippingItemDot()
                    : const InActiveShippingItemDot(),
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
                    '$price جنيه',
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
      ),
    );
  }
}
