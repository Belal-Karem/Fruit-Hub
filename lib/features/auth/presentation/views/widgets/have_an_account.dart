import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'تمتلك حساب بالفعل؟',
        style: AppTextStyle.semiBold16.copyWith(color: const Color(0xff616A6B)),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushNamed(context, LoginView.routeName),
            text: ' تسجيل دخول',
            style: AppTextStyle.bold13.copyWith(color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }
}
