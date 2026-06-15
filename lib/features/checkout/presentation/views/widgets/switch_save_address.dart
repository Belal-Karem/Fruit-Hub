import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_text_style.dart';

class SwitchSaveAddress extends StatefulWidget {
  const SwitchSaveAddress({super.key});

  @override
  State<SwitchSaveAddress> createState() => _SwitchSaveAddressState();
}

class _SwitchSaveAddressState extends State<SwitchSaveAddress> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: isSelected,
          onChanged: (value) {
            isSelected = value;
            setState(() {});
          },
        ),
        const SizedBox(width: 8),
        Text(
          'حفظ العنوان',
          style: AppTextStyle.semiBold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
      ],
    );
  }
}
