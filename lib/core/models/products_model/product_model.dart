import '../../entites/product_entity.dart';
import 'review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final bool isFeatured;
  final num price;
  String? imageUrl;
  final int expirationsMonthsl;
  final bool isOrganic;
  final int numberOfCalories;
  final int sellingCount;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
    this.ratingCount = 0,
    this.avgRating = 0,
    required this.reviews,
    required this.name,
    required this.description,
    required this.code,
    this.isFeatured = false,
    this.sellingCount = 0,
    required this.price,
    this.isOrganic = false,
    this.imageUrl,
    required this.expirationsMonthsl,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)),
            )
          : [],
      name: json['name'],
      description: json['description'],
      sellingCount: json['sellingCount'],
      code: json['code'],
      isFeatured: json['isFeatured'],

      price: json['price'],
      imageUrl: json['imageUrl'],
      expirationsMonthsl: json['expirationsMonthsl'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      avgRating: 0,
      ratingCount: json['ratingCount'],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      reviews: reviews.map((e) => e.toEntity()).toList(),
      name: name,
      description: description,
      code: code,
      isFeatured: isFeatured,
      price: price,
      imageUrl: imageUrl,
      expirationsMonthsl: expirationsMonthsl,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      avgRating: avgRating,
      ratingCount: ratingCount,
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
      'sellingCount': sellingCount,
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
