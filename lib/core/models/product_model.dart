import 'dart:io';

import 'package:fruit_hub/core/entites/product_entity.dart';

import 'review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final bool isFeatured;
  final num price;
  final File image;
  String? imageUrl;
  final int expirationsMonthsl;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.reviews,
    required this.name,
    required this.description,
    required this.code,
    required this.isFeatured,
    required this.price,
    required this.image,
    this.isOrganic = false,
    this.imageUrl,
    required this.expirationsMonthsl,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      name: entity.name,
      description: entity.description,
      code: entity.code,
      isFeatured: entity.isFeatured,
      price: entity.price,
      image: entity.image,
      imageUrl: entity.imageUrl,
      isOrganic: entity.isOrganic,
      expirationsMonthsl: entity.expirationsMonthsl,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
    );
  }

  tojson() {
    return {
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'name': name,
      'description': description,
      'code': code,
      'isFeatured': isFeatured,
      'price': price,
      'imageUrl': imageUrl,
      'expirationsMonthsl': expirationsMonthsl,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
    };
  }
}
