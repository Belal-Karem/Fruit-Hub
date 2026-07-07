import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entites/product_entity.dart';
import '../../../../favorit/presentation/manager/cubit/favorit_cubit.dart';

class CustomFavoriteIcon extends StatelessWidget {
  const CustomFavoriteIcon({
    super.key,
    required this.product,
    required this.icon,
  });

  final ProductEntity product;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoritCubit>().addFavorit(product);
      },
      icon: icon,
    );
  }
}
