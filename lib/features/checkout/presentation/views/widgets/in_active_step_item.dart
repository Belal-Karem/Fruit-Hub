import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 23,
          height: 23,
          decoration: ShapeDecoration(
            color: const Color(0xFFF2F3F3),
            shape: OvalBorder(),
          ),
          child: Center(child: Text('2', style: AppTextStyle.semiBold13)),
        ),
        const SizedBox(width: 4),
        Text(
          'الشحن',
          style: AppTextStyle.bold13.copyWith(color: const Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
