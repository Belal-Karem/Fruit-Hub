import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/helper_functions/get_dummy_product.dart';
import 'package:fruit_hub/core/widgets/custom_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'Products_grid_view.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsgGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.message),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsgGridView(products: getDummyProductList),
          );
        }
      },
    );
  }
}
