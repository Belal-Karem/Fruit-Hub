import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/presentation/views/orders_view.dart';
import 'package:fruit_hub/features/profile/presentation/views/profile_view.dart';

import '../../../../core/utils/app_images.dart';

class AccountItemEntity {
  final String title;
  final String icon;
  final AccountItemType type;
  final void Function()? onTap;

  const AccountItemEntity({
    this.onTap,
    required this.title,
    required this.icon,
    required this.type,
  });
}

List<AccountItemEntity> getAccountItemList(BuildContext context) => [
  AccountItemEntity(
    title: 'الملف الشخصي',
    icon: Assets.imagesUserIcon,
    type: AccountItemType.arrow,
    onTap: () {
      Navigator.pushNamed(context, ProfileView.routeName);
    },
  ),
  AccountItemEntity(
    title: 'طلباتي',
    icon: Assets.imagesOrdersIcon,
    type: AccountItemType.arrow,
    onTap: () {
      Navigator.pushNamed(context, OrdersView.routeName);
    },
  ),
  AccountItemEntity(
    title: 'المفضلة',
    icon: Assets.imagesFavoritesIcon,
    type: AccountItemType.arrow,
  ),
  AccountItemEntity(
    title: 'الإشعارات',
    icon: Assets.imagesNotificationIcon,
    type: AccountItemType.switchTile,
  ),
  AccountItemEntity(
    title: 'الوضع',
    icon: Assets.imagesMagicpenIcon,
    type: AccountItemType.switchTile,
  ),
];

enum AccountItemType { arrow, switchTile }
