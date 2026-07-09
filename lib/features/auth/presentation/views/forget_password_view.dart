import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = 'forget_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ForgetPasswordViewBody());
  }
}
