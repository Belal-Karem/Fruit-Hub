import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/styles/app_color.dart';
import 'package:fruit_hub/core/utils/styles/app_text_style.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'ليس لديك حساب؟ ',
        style: AppTextStyle.semiBold16.copyWith(color: const Color(0xff616A6B)),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  Navigator.pushNamed(context, SignupView.routeName),
            text: 'قم بإنشاء حساب',
            style: AppTextStyle.bold13.copyWith(color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }
}
