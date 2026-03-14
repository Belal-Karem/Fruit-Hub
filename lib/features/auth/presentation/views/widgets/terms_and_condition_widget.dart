import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key, required this.onChanged});

  final ValueChanged onChanged;

  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  bool termsAccepted = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: termsAccepted,
          onChanged: (value) {
            termsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'من خلال إنشاء حساب ، فإنك توافق على',
              style: AppTextStyle.semiBold16.copyWith(
                color: const Color(0xff616A6B),
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () {},

                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppTextStyle.bold13.copyWith(
                    color: AppColor.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
