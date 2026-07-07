import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_favorit_icon.dart';

import '../../../../../core/entites/product_entity.dart';
import '../../../../favorit/presentation/manager/cubit/favorit_cubit.dart';

class FavoritIconBlocBuilder extends StatelessWidget {
  const FavoritIconBlocBuilder({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritCubit, FavoritState>(
      builder: (context, state) {
        if (state is AddFavoritSuccess) {
          return CustomFavoriteIcon(
            product: product,
            icon: Icon(Icons.favorite, color: Colors.red),
          );
        } else {
          return CustomFavoriteIcon(
            product: product,
            icon: Icon(Icons.favorite_outline),
          );
        }
      },
    );
  }
}
