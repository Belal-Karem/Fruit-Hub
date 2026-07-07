import 'package:flutter/material.dart';
import '../../../../../core/widgets/fruit_item.dart';
import '../../../domain/entites/favorit_entity.dart';

class FavoritGridView extends StatelessWidget {
  const FavoritGridView({super.key, required this.favorit});

  final List<FavoritEntity> favorit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: favorit.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem(product: favorit[index].products);
      },
    );
  }
}
