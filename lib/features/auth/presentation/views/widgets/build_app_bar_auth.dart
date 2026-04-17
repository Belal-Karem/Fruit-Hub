import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

@override
AppBar buildAppBarAuth(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
    ),
    centerTitle: true,
    title: Text(title, style: AppTextStyle.bold19),
  );
}
