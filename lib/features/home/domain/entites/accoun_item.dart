import '../../../../core/utils/app_images.dart';

class AccountItemEntity {
  final String title;
  final String icon;
  final AccountItemType type;
  // final VoidCallback? onTap;

  const AccountItemEntity({
    required this.title,
    required this.icon,
    required this.type,
  });
}

List<AccountItemEntity> getAccountItemList = [
  AccountItemEntity(
    title: 'الملف الشخصي',
    icon: Assets.imagesUserIcon,
    type: AccountItemType.arrow,
  ),
  AccountItemEntity(
    title: 'طلباتي',
    icon: Assets.imagesOrdersIcon,
    type: AccountItemType.arrow,
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
