import 'package:fruit_hub/core/entites/review_entite.dart';

ReviewEntite getAvgRating(List<ReviewEntite> reviews) {
  num sum = 0;
  for (var review in reviews) {
    sum += review.rating;
  }
  return ReviewEntite(
    rating: sum / reviews.length,
    name: '',
    image: '',
    date: '',
    reviewdescription: '',
  );
}
