import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

import '../../../../../core/entites/product_entity.dart';

class ProductsgGridView extends StatelessWidget {
  const ProductsgGridView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem(product: products[index]);
      },
    );
  }
}
