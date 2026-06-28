import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart' show SvgPicture;

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/theme/app_text_style.dart';
import '../../../../../core/widgets/custom_switch.dart';
import '../../../domain/entites/accoun_item.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({super.key, required this.item});

  final AccountItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(item.icon),
        const SizedBox(width: 7),
        Text(
          item.title,
          style: AppTextStyle.semiBold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        const Spacer(),
        buildTrailing(item),
      ],
    );
  }
}

Widget buildTrailing(AccountItemEntity item) {
  switch (item.type) {
    case AccountItemType.arrow:
      return SvgPicture.asset(Assets.imagesArrowRight);

    case AccountItemType.switchTile:
      return CustomSwitch();
  }
}
