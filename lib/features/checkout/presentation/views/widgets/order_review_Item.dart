import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_decorations.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

class OrderReviewItem extends StatelessWidget {
  const OrderReviewItem({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyle.bold13),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
          decoration: AppDecorations.grayBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
