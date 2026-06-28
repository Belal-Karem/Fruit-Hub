import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/product_details_seaction.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/product_hero_section.dart';

import '../../../../../constants.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              ProductHeroSection(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: ProductDetailsSection(),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
