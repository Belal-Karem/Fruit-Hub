import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_decorations.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

class OrderReviewItem extends StatelessWidget {
  const OrderReviewItem({super.key, this.title, required this.child});

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox()
            : Text(title!, style: AppTextStyle.bold13),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
          decoration: AppDecorations.grayBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
