import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/favorit/presentation/views/widgets/favorit_grid_view.dart';

import '../../../../../core/helper_functions/get_dummy_product.dart';
import '../../../../../core/helper_functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_modal_progress_hud.dart';
import '../../manager/cubit/favorit_cubit.dart';

class FavoritGridViewBlocBuilder extends StatelessWidget {
  const FavoritGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritCubit, FavoritState>(
      listener: (context, state) {
        if (state is FavoritFailure) {
          showErrorBar(context, state.message);
        }
        if (state is FavoritLoading) {
          CustomModalProgressHUD(
            isLoading: FavoritLoading is FavoritLoading ? true : false,
            child: FavoritGridView(products: getDummyProductList),
          );
        }
      },
      builder: (context, state) {
        if (state is GetFavoritSuccess) {
          return FavoritGridView(products: state.productEntities);
        } else {
          return FavoritGridView(products: getDummyProductList);
        }
      },
    );
  }
}
