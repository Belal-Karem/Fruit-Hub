import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.text,
    required this.imagePath,
    this.onPressed,
  });

  final String text;
  final String imagePath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: const Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            SvgPicture.asset(imagePath),
            Spacer(),
            Text(
              text,
              style: AppTextStyle.semiBold16.copyWith(
                color: Colors.black,
                // height: 1.40,
              ),
            ),
            Spacer(),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
