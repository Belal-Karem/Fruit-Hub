import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/theme/app_text_style.dart';
import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/otp_input_field.dart';

class OtpVerifiViewBody extends StatelessWidget {
  const OtpVerifiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            buildAppBar(
              context: context,
              title: 'التحقق من الرمز',
              showNotification: false,
            ),
            const SizedBox(height: 24),
            Text(
              'أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي   Maxxx@email.com',
              textAlign: TextAlign.right,
              style: AppTextStyle.semiBold16.copyWith(
                color: const Color(0xFF616A6B),
              ),
            ),
            const SizedBox(height: 31),
            OtpInputField(),
            const SizedBox(height: 30),
            CustomButton(text: 'تحقق من الرمز'),
            const SizedBox(height: 24),
            Text(
              'إعادة إرسال الرمز',
              textAlign: TextAlign.center,
              style: AppTextStyle.semiBold16.copyWith(
                color: AppColor.lightPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
