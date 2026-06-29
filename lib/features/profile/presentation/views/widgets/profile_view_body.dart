import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/get_user.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';

import '../../../../../constants.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildAppBar(
                      context: context,
                      title: 'الملف الشخصي',
                      showNotification: false,
                    ),
                    const SizedBox(height: 24),
                    Text('المعلومات الشخصيه', style: AppTextStyle.semiBold13),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                      hintText: getUserData().name,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                      hintText: getUserData().email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    Text('تغيير كلمة المرور', style: AppTextStyle.semiBold13),
                    const SizedBox(height: 8),
                    PasswordField(hintText: 'كلمة المرور الحالي'),
                    const SizedBox(height: 8),
                    PasswordField(hintText: 'كلمة المرور الجديده'),
                    const SizedBox(height: 8),
                    PasswordField(hintText: "تأكيد كلمة المرور الجديده"),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.sizeOf(context).height * 0.05,
            child: CustomButton(text: 'حفظ التغييرات'),
          ),
        ],
      ),
    );
  }
}
