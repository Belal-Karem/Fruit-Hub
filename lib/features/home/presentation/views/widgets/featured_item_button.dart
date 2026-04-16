import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FittedBox(
          child: Text(
            'تسوق الان',
            style: AppTextStyle.bold13.copyWith(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }
}
