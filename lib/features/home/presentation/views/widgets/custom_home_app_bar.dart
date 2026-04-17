import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

import '../../../../../core/widgets/notification_widget.dart';

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
      trailing: const NotificationWidget(),
    );
  }
}
