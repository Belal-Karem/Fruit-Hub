import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';

import '../utils/theme/app_text_style.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
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
