import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/get_user.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/profile/presentation/manager/update_user_date/update_user_data_cubit.dart';
import 'package:fruit_hub/features/profile/presentation/views/widgets/re_auth_dialog.dart';

import '../../../../../constants.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

String? name = null;
String? email = null;
late String? currentPassword, newPassword, confirmNewPassword;

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
                          if (value != null &&
                              value.isNotEmpty &&
                              value != "") {
                            name = value;
                          } else {
                            name = null;
                          }
                        },
                        hintText: getUserData().name,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        onSaved: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value != "") {
                            email = value;
                          } else {
                            email = null;
                          }
                        },
                        hintText: getUserData().email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      Text('تغيير كلمة المرور', style: AppTextStyle.semiBold13),
                      const SizedBox(height: 8),
                      PasswordField(
                        onSaved: (value) {
                          if (value != null) currentPassword = value;
                        },
                        hintText: 'كلمة المرور الحالي',
                      ),
                      const SizedBox(height: 8),
                      PasswordField(
                        onSaved: (value) {
                          if (value != null) newPassword = value;
                        },
                        hintText: 'كلمة المرور الجديده',
                      ),
                      const SizedBox(height: 8),
                      PasswordField(
                        onSaved: (value) {
                          if (value != null) confirmNewPassword = value;
                        },
                        hintText: "تأكيد كلمة المرور الجديده",
                      ),
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
              onPressed: () {
                formKey.currentState!.save();
                if (email != null && name != null) {
                  updateUserDataHandel(context);
                  return;
                } else if (newPassword != null) {
                  updatePasswoedHandling(context);
                  return;
                }
                // updateUserDataHandel(context);
                // updatePasswoedHandling(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void updatePasswoedHandling(BuildContext context) {
    if (newPassword == confirmNewPassword) {
      context.read<UpdateUserDataCubit>().updatePassword(
        currentPassword: currentPassword!,
        newPassword: newPassword!,
      );
    } else {
      showErrorBar(context, 'كلمة المرور غير متطابقة');
    }
  }

  void updateUserDataHandel(BuildContext context) async {
    if (email != null && email != getUserData().email) {
      currentPassword = await showDialog<String>(
        context: context,
        builder: (context) => const ReAuthDialog(),
      );
      if (currentPassword == null || currentPassword!.isEmpty) {
        showErrorBar(
          context,
          'يرجى إدخال كلمة المرور لتغيير البريد الإلكتروني',
        );
        return;
      }
    }
    context.read<UpdateUserDataCubit>().updateUserData(
      name: name,
      email: email,
      currentPassword: currentPassword,
    );
  }
}
