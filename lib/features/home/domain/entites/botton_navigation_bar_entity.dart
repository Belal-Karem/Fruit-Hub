import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/home/presentation/views/main_view.dart';

import '../../presentation/views/products_view.dart';

class BottonNavigationBarEntity {
  final String inActiveItem, activeItem;
  final String name;
  final String routeName;

  BottonNavigationBarEntity({
    required this.inActiveItem,
    required this.activeItem,
    required this.name,
    required this.routeName,
  });
}

List<BottonNavigationBarEntity> get getBottonNavigationBarItems => [
  BottonNavigationBarEntity(
    inActiveItem: Assets.imagesVuesaxOutlineHome,
    activeItem: Assets.imagesVuesaxBoldHome,
    name: 'الرئيسية',
    routeName: MainView.routeName,
  ),

  BottonNavigationBarEntity(
    inActiveItem: Assets.imagesVuesaxOutlineProduct,
    activeItem: Assets.imagesVuesaxBoldProduct,
    name: 'المنتجات',
    routeName: ProductsView.routeName,
  ),
  BottonNavigationBarEntity(
    inActiveItem: Assets.imagesVuesaxOutlineShoppingCart,
    activeItem: Assets.imagesVuesaxBoldShoppingCart,
    name: 'سلة التسوق',
    routeName: '',
  ),
  BottonNavigationBarEntity(
    inActiveItem: Assets.imagesVuesaxOutlineUser,
    activeItem: Assets.imagesVuesaxBoldUser,
    name: 'حسابي',
    routeName: '',
  ),
];
