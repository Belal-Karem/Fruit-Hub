import '../entites/review_entite.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewdescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewdescription,
  });

  factory ReviewModel.fromEntity(ReviewEntite entite) => ReviewModel(
    name: entite.name,
    image: entite.image,
    rating: entite.rating,
    date: entite.date,
    reviewdescription: entite.reviewdescription,
  );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    name: json['name'],
    image: json['image'],
    rating: json['rating'],
    date: json['date'],
    reviewdescription: json['reviewdescription'],
  );

  ReviewEntite toEntity() => ReviewEntite(
    name: name,
    image: image,
    rating: rating,
    date: date,
    reviewdescription: reviewdescription,
  );

  toJson() => {
    'name': name,
    'image': image,
    'rating': rating,
    'date': date,
    'reviewdescription': reviewdescription,
  };
  copyWith({
    String? name,
    String? image,
    num? rating,
    String? date,
    String? reviewdescription,
  }) {
    return ReviewEntite(
      name: name ?? this.name,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      reviewdescription: reviewdescription ?? this.reviewdescription,
    );
  }
}
