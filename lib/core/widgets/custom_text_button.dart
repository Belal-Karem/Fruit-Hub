import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/styles/app_color.dart';
import 'package:fruit_hub/core/utils/styles/app_text_style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style:
            style ??
            AppTextStyle.bold13.copyWith(color: AppColor.lightPrimaryColor),
      ),
    );
  }
}
