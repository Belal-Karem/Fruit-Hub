import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';

import '../utils/theme/app_text_style.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  bool showBackButton = true,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFF1F1F5), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.arrow_back_ios, color: Colors.black)],
          ),
        ),
      ),
    ),
    elevation: 0,
    title: Text(title, style: AppTextStyle.bold19),
    centerTitle: true,
    actions: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
  );
}
