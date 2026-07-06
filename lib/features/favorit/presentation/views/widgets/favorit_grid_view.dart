import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_dummy_product.dart';
import '../../../../../core/widgets/fruit_item.dart';

class FavoritGridView extends StatelessWidget {
  const FavoritGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: getDummyProductList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem(product: getDummyProductList[index]);
      },
    );
  }
}
