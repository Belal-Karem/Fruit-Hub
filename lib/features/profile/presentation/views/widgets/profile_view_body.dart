import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/get_user.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/profile/presentation/manager/cubit/update_user_data_cubit_cubit.dart';

import '../../../../../constants.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

String? name;
String? email;
late String? currentPassword, newPassword;

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: formKey,
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
                        onSaved: (value) {
                          if (value != null) name = value;
                        },
                        hintText: getUserData().name,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        onSaved: (value) {
                          if (value != null) email = value;
                        },
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
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.sizeOf(context).height * 0.05,
            child: CustomButton(
              text: 'حفظ التغييرات',
              onPressed: () async {
                formKey.currentState!.save();
                if (email != null && email != getUserData().email) {
                  currentPassword = await showDialog<String>(
                    context: context,
                    builder: (context) => const ReAuthenticationDialog(),
                  );
                  if (currentPassword == null || currentPassword!.isEmpty) {
                    showErrorBar(
                      context,
                      'يرجى إدخال كلمة المرور لتغيير البريد الإلكتروني',
                    );
                    return;
                  }
                }
                context.read<UpdateUserDataCubitCubit>().updateUserData(
                  name: name,
                  email: email,
                  currentPassword: currentPassword,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReAuthenticationDialog extends StatefulWidget {
  const ReAuthenticationDialog({super.key});

  @override
  State<ReAuthenticationDialog> createState() => _ReAuthenticationDialogState();
}

class _ReAuthenticationDialogState extends State<ReAuthenticationDialog> {
  String? password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  if (value != null) password = value;
                },
                hintText: 'يرجى إدخال كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('إلغاء'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      Navigator.pop(context, password);
                    },
                    child: const Text('تأكيد'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
