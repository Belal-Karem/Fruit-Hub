import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class SearchTexField extends StatelessWidget {
  const SearchTexField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: Border(),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'ابحث عن.......',
          hintStyle: AppTextStyle.regular13.copyWith(color: Color(0xFF949D9E)),
          prefixIcon: buildIcon(Assets.imagesSearchIcon),
          suffixIcon: buildIcon(Assets.imagesSettingFormat),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  SizedBox buildIcon(String imagePath) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Center(child: SvgPicture.asset(imagePath)),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Colors.white, width: 1),
    );
  }
}
