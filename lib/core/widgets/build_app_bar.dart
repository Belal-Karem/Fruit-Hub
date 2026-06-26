import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_back_icon.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';

import '../utils/theme/app_text_style.dart';

AppBar buildAppBar({
  required BuildContext context,
  String? title = '',
  bool showBackButton = true,
  bool showNotification = true,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    leading: Visibility(visible: showBackButton, child: CustomBackIcon()),
    elevation: 0,
    title: Text(title!, style: AppTextStyle.bold19),
    centerTitle: true,
    actions: [
      Visibility(
        visible: showNotification,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ),
    ],
  );
}
