import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/Products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/product_view_header.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/search_text_field.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
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
                buildAppBar(
                  context: context,
                  title: 'المنتجات',
                  showBackButton: false,
                ),
                const SizedBox(height: 16),
                const SearchTexField(),
                const SizedBox(height: 12),
                ProductViewHeader(
                  productslength: context.read<ProductsCubit>().productslength,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
