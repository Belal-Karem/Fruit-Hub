import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 23,
          height: 23,
          decoration: ShapeDecoration(
            color: AppColor.primaryColor,
            shape: OvalBorder(),
          ),
          child: Icon(Icons.check, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 4),
        Text(
          'الشحن',
          style: AppTextStyle.bold13.copyWith(color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
