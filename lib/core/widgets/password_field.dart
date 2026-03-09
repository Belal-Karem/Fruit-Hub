import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isPassword = !isPassword;
          });
        },
        icon: Icon(
          isPassword ? Icons.visibility : Icons.visibility_off_outlined,
          color: Color(0xffC9CECF),
        ),
      ),
    );
  }
}
