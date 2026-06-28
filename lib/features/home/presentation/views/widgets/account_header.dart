import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Image.asset(Assets.imagesProfileImageTest),
          ),
          Positioned(
            bottom: -15,
            right: 0,
            left: 0,
            child: AvatarEditButton(onTap: () {}),
          ),
        ],
      ),
      title: Text(
        getUserData().name,
        textAlign: TextAlign.right,
        style: AppTextStyle.bold13,
      ),
      subtitle: Text(getUserData().email, style: AppTextStyle.regular13),
    );
  }
}

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
