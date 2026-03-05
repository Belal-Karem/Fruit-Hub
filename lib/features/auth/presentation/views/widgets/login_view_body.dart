import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                keyboardType: TextInputType.visiblePassword,
                hintText: 'كلمة المرور',
                obscureText: isPassword,
                onPressed: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                suffixIcon: Icon(
                  isPassword ? Icons.visibility : Icons.visibility_off_outlined,
                  color: Color(0xffC9CECF),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: AppTextStyle.bold13.copyWith(
                    color: AppColor.lightPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(text: 'تسجيل دخول'),
              const SizedBox(height: 33),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 37),
              const OrDivider(),
              const SizedBox(height: 20),
              const SocialLoginButton(
                text: 'تسجيل بواسطة جوجل',
                imagePath: Assets.imagesGoogleIcon,
              ),
              const SizedBox(height: 16),
              const SocialLoginButton(
                text: 'تسجيل بواسطة أبل',
                imagePath: Assets.imagesAppleIcon,
              ),
              const SizedBox(height: 16),
              const SocialLoginButton(
                text: 'تسجيل بواسطة فيسبوك',
                imagePath: Assets.imagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
