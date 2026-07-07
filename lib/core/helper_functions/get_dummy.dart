import 'dart:io';

import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/about/domain/entites/about_entity.dart';
import 'package:fruit_hub/features/favorit/domain/entites/favorit_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    reviews: [],
    expirationsMonthsl: 6,
    numberOfCalories: 52,
    unitAmount: 1,
    isOrganic: true,
    name: 'Apple',
    description: 'Fresh and delicious red apple',
    code: 'APL001',
    isFeatured: true,
    price: 25.5,
    image: File('path/to/image.jpg'),
    imageUrl: null,
  );
}

FavoritEntity getDummyFavorit() {
  return FavoritEntity(uId: '', isFavorit: true, products: getDummyProduct());
}

AboutEntity getDummyAbout() {
  return AboutEntity(
    aboutText:
        'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص \ هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص\ هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. ',
  );
}

List<ProductEntity> getDummyProductList = [
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
];

List<FavoritEntity> getDummyFavoritList = [
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
  getDummyFavorit(),
];
