import 'dart:io';

import 'review_entite.dart';

class ProductEntity {
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
  final List<ReviewEntite> reviews;

  ProductEntity({
    required this.reviews,
    required this.expirationsMonthsl,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.name,
    required this.description,
    required this.code,
    required this.isFeatured,
    required this.price,
    required this.image,
    this.imageUrl,
  });
}
