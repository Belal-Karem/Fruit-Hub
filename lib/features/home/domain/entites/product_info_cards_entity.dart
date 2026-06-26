import 'package:fruit_hub/core/utils/app_images.dart';

class ProductInfoCardsEntity {
  final String title, supTitle;
  final String imagePath;

  ProductInfoCardsEntity({
    required this.title,
    required this.supTitle,
    required this.imagePath,
  });
}

List<ProductInfoCardsEntity> getProductInfoCards() {
  return [
    ProductInfoCardsEntity(
      title: 'عام',
      supTitle: 'الصلاحيه',
      imagePath: Assets.imagesValidity,
    ),
    ProductInfoCardsEntity(
      title: '100%',
      supTitle: 'اوجانيك',
      imagePath: Assets.imagesOrganic,
    ),
    ProductInfoCardsEntity(
      title: '80 كالوري',
      supTitle: '100 جرام',
      imagePath: Assets.imagesCalories,
    ),
    ProductInfoCardsEntity(
      title: '4.8 (256)',
      supTitle: 'Reviews',
      imagePath: Assets.imagesReviews,
    ),
  ];
}
