import 'dart:io';

import 'package:fruit_hub/core/entites/product_entity.dart';

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
