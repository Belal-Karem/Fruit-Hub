import 'package:fruit_hub/core/utils/app_images.dart';

class BottonNavigationBarEntity {
  final String inActiveItem, activeItem;
  final String name;

  BottonNavigationBarEntity({
    required this.inActiveItem,
    required this.activeItem,
    required this.name,
  });
}

List<BottonNavigationBarEntity> get getBottonNavigationBarItems => [
  BottonNavigationBarEntity(
    inActiveItem: Assets.imagesVuesaxOutlineHome,
    activeItem: Assets.imagesVuesaxBoldHome,
    name: 'الرئيسية',
  ),

  BottonNavigationBarEntity(
    inActiveItem: Assets.imagesVuesaxOutlineProduct,
    activeItem: Assets.imagesVuesaxBoldProduct,
    name: 'المنتجات',
  ),
  BottonNavigationBarEntity(
    inActiveItem: Assets.imagesVuesaxOutlineShoppingCart,
    activeItem: Assets.imagesVuesaxBoldShoppingCart,
    name: 'سلة التسوق',
  ),
  BottonNavigationBarEntity(
    inActiveItem: Assets.imagesVuesaxOutlineUser,
    activeItem: Assets.imagesVuesaxBoldUser,
    name: 'حسابي',
  ),
];
