import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 23,
          height: 23,
          decoration: ShapeDecoration(
            color: const Color(0xFFF2F3F3),
            shape: OvalBorder(),
          ),
          child: Center(child: Text('$index', style: AppTextStyle.semiBold13)),
        ),
        const SizedBox(width: 4),
        Text(
          '$text',
          style: AppTextStyle.bold13.copyWith(color: const Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
