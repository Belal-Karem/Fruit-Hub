import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/product_details_seaction.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/product_hero_section.dart';

import '../../../../../constants.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key});

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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),

                child: CustomButton(text: 'أضف الي السلة', onPressed: () {}),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
