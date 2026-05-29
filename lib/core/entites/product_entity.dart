import 'dart:io';

import 'package:equatable/equatable.dart';

import 'review_entite.dart';

class ProductEntity extends Equatable {
  final String name;
  final String description;
  final String code;
  final bool isFeatured;
  final num price;
  final File? image;
  String? imageUrl;
  final int expirationsMonthsl;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
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
    this.image,
    this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
  });

  @override
  List<Object?> get props => [code, name];
}
