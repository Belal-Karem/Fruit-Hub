import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/styles/app_text_style.dart';

@override
AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
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
