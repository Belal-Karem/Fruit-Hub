import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/models/products_model/product_model.dart';
import '../../domain/entites/favorit_entity.dart';

class FavoritModel {
  final String uId;
  final bool isFavorit;
  final ProductEntity products;

  FavoritModel({
    required this.uId,
    required this.isFavorit,
    required this.products,
  });

  factory FavoritModel.fromEntity(FavoritEntity entity) => FavoritModel(
    uId: entity.uId,
    isFavorit: entity.isFavorit,
    products: entity.products,
  );

  factory FavoritModel.fromJson(Map<String, dynamic> json) => FavoritModel(
    uId: json['uId'],
    isFavorit: json['isFavorit'],
    products: ProductModel.fromJson(json['products']).toEntity(),
  );

  Map<String, dynamic> tojson() => {
    'uId': uId,
    'isFavorit': isFavorit,
    'products': ProductModel.fromEntity(products).tojson(),
  };

  FavoritEntity toEntity() =>
      FavoritEntity(uId: uId, isFavorit: isFavorit, products: products);
}
