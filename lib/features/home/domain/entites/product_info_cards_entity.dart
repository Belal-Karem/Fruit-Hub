import 'package:fruit_hub/core/entites/product_entity.dart';
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

List<ProductInfoCardsEntity> getProductInfoCards(ProductEntity product) {
  String organic = product.isOrganic ? 'اورجانيك' : 'غير اورجانيك';
  String reviews = product.reviews.isEmpty ? '0' : product.reviews.toString();
  return [
    ProductInfoCardsEntity(
      title: '${product.expirationsMonthsl.toString()}شهور',
      supTitle: 'الصلاحيه',
      imagePath: Assets.imagesValidity,
    ),
    ProductInfoCardsEntity(
      title: '100%',
      supTitle: organic,
      imagePath: Assets.imagesOrganic,
    ),
    ProductInfoCardsEntity(
      title: '${product.price} كالوري',
      supTitle: '${product.unitAmount} جرام',
      imagePath: Assets.imagesCalories,
    ),
    ProductInfoCardsEntity(
      title: '${product.avgRating} ($reviews)',
      supTitle: 'Reviews',
      imagePath: Assets.imagesReviews,
    ),
  ];
}
