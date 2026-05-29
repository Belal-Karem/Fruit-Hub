import 'package:flutter/material.dart';

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
