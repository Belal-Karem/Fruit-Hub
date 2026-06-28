import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/product_details/domain/entites/product_info_cards_entity.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/product_info_item.dart';

class ProductInfoCards extends StatelessWidget {
  const ProductInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getProductInfoCards(context.read<ProductEntity>()).length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (context, index) {
        return ProductInfoItem(
          productInfo: getProductInfoCards(
            context.read<ProductEntity>(),
          )[index],
        );
      },
    );
  }
}
