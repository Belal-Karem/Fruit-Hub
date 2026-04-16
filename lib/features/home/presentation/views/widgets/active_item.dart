import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: 78,
          height: 30,
          decoration: ShapeDecoration(
            color: const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1B5E37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(child: SvgPicture.asset(image)),
              ),
              const SizedBox(width: 4),
              Text(
                name,
                style: AppTextStyle.semiBold11.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
