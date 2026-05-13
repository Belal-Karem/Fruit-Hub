import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'best_selling_grid_view.dart';
import 'best_selling_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPadding),
                const CustomHomeAppBar(),
                const SizedBox(height: 16),
                const SearchTexField(),
                const SizedBox(height: 12),
                FeaturedListView(),
                const SizedBox(height: 12),
                BestSellingHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}
