import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: AppTextStyle.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: AppTextStyle.bold16.copyWith(color: Color(0xFF0C0D0D)),
      ),
      trailing: Container(
        padding: EdgeInsets.all(7),
        decoration: ShapeDecoration(
          color: Color(0xFFEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
