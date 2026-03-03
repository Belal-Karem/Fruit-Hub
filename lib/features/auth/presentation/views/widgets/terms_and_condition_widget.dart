import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/styles/app_color.dart';
import 'package:fruit_hub/core/utils/styles/app_text_style.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width:
              MediaQuery.sizeOf(context).width - (kHorizontalPadding * 2) - 48,
          child: Text.rich(
            TextSpan(
              text: 'من خلال إنشاء حساب ، فإنك توافق على',
              style: AppTextStyle.semiBold16.copyWith(
                color: const Color(0xff616A6B),
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () {},

                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppTextStyle.bold13.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
