import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'best_selling_grid_view_bloc_builder.dart';
import 'best_selling_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBestSellingProducts();
  }

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
          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
