import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({
    super.key,
    required this.increaseQuantity,
    required this.decreaseQuantity,
    required this.quantity,
  });

  final int quantity;
  final void Function() increaseQuantity;
  final void Function() decreaseQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CartCAtionButton(
          icon: Icons.add,
          color: AppColor.primaryColor,
          onPressed: increaseQuantity,
        ),
        const SizedBox(width: 16),
        Text(
          '$quantity',
          textAlign: TextAlign.center,
          style: AppTextStyle.bold16,
        ),
        const SizedBox(width: 16),
        CartCAtionButton(
          icon: Icons.remove,
          iconColor: const Color(0xff979899),
          color: const Color(0xFFF3F5F7),
          onPressed: decreaseQuantity,
        ),
      ],
    );
  }
}
