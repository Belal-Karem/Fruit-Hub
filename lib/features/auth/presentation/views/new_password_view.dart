import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/new_password_view_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  static const routeName = 'new_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NewPasswordViewBody());
  }
}
