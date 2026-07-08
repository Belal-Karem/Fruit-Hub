import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_text_style.dart';
import 'custom_rating_bar.dart';

class RatingBarItem extends StatelessWidget {
  const RatingBarItem({
    super.key,
    required this.textNumber,
    required this.value,
  });

  final String textNumber;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: CustomRatingBar(value: value)),
        const SizedBox(width: 7),
        Text(textNumber, style: AppTextStyle.semiBold13),
      ],
    );
  }
}
