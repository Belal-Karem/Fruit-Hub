import 'package:fruit_hub/core/entites/product_entity.dart';

class FavoritEntity {
  final String uId;
  final bool isFavorit;
  final ProductEntity products;

  FavoritEntity({
    required this.uId,
    required this.isFavorit,
    required this.products,
  });
}
