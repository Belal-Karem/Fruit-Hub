import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/styles/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = true,
    this.suffixIcon,
    this.onPressed,
    required this.keyboardType,
  });
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onPressed;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: suffixIcon ?? const SizedBox(),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.bold13,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: const Color(0xFFE6E9E9), width: 1),
    );
  }
}
