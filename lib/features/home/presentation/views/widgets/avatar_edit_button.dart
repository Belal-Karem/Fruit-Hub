import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_images.dart';

class AvatarEditButton extends StatelessWidget {
  const AvatarEditButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 15,
        child: CircleAvatar(
          backgroundColor: Color(0xffF9F9F9),
          radius: 12,
          child: SvgPicture.asset(Assets.imagesCameraIcon),
        ),
      ),
    );
  }
}
