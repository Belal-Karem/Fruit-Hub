import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/theme/app_text_style.dart';
import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(
              context: context,
              title: 'كلمة مرور جديدة',
              showNotification: false,
            ),
            const SizedBox(height: 24),
            Text(
              'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
              textAlign: TextAlign.right,
              style: AppTextStyle.semiBold16.copyWith(
                color: const Color(0xFF616A6B),
              ),
            ),
            const SizedBox(height: 31),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'تاكيد كلمة المرور',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 30),
            CustomButton(text: 'إنشاء كلمة مرور جديدة', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
