import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/manger/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_condition_widget.dart';

import '../../../../../core/helper_functions/show_snack_bar.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditionWidget(
                onChanged: (value) {
                  termsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (termsAccepted) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .creareUserWithEmailAndPassword(
                            email,
                            password,
                            name,
                          );
                    } else {
                      buildErrorBar(
                        context,
                        'يجب عليك الموفقا علي الشروط و الاحكام ',
                      );
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 26),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
