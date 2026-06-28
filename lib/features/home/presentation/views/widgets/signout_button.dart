import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class SignoutButton extends StatelessWidget {
  const SignoutButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: const Color(0xFFEBF9F1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(flex: 2),
            Text(
              'تسجيل الخروج',
              style: AppTextStyle.regular13.copyWith(
                color: const Color(0xFF1B5E37),
              ),
            ),
            const Spacer(),
            SvgPicture.asset(Assets.imagesSignoutIcon),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
