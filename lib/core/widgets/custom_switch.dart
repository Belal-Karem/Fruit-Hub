import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: SizedBox(
        width: 40,
        height: 20,
        child: Switch(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.white,
          inactiveThumbColor: Colors.white,
          activeTrackColor: AppColor.primaryColor,
          inactiveTrackColor: const Color(0xFFD9DCE5),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
