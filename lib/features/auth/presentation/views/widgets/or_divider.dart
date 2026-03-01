import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/styles/app_text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xFFDCDEDE), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.88),
          child: Text(
            'أو',
            textAlign: TextAlign.center,
            style: AppTextStyle.semiBold16,
          ),
        ),
        Expanded(child: Divider(color: const Color(0xFFDCDEDE), thickness: 1)),
      ],
    );
  }
}
