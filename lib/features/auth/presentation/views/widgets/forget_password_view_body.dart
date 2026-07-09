import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            buildAppBar(
              context: context,
              title: 'نسيان كلمة المرور',
              showNotification: false,
            ),
            const SizedBox(height: 24),
            Text(
              'لا تقلق ، ما عليك سوى كتابة البيانات الخاصة بك وسنرسل رمز التحقق.',
              textAlign: TextAlign.right,
              style: AppTextStyle.semiBold16.copyWith(
                color: const Color(0xFF616A6B),
              ),
            ),
            const SizedBox(height: 31),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 30),
            CustomButton(text: 'نسيت كلمة المرور'),
          ],
        ),
      ),
    );
  }
}
