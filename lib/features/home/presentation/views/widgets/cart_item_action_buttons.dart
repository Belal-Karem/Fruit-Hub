import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartCAtionButton(
          icon: Icons.add,
          color: AppColor.primaryColor,
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        Text('$count', textAlign: TextAlign.center, style: AppTextStyle.bold16),
        const SizedBox(width: 16),
        CartCAtionButton(
          icon: Icons.remove,
          iconColor: const Color(0xff979899),
          color: const Color(0xFFF3F5F7),
          onPressed: () {},
        ),
      ],
    );
  }
}

class CartCAtionButton extends StatelessWidget {
  const CartCAtionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    this.iconColor,
  });

  final IconData icon;
  final Color? color, iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Center(
          child: Icon(icon, size: 16, color: iconColor ?? Colors.white),
        ),
      ),
    );
  }
}
