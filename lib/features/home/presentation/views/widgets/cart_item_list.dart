import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item_bloc_builder.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_divider.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => CustomDivider(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CartItemBlocBuilder(cartItemEntity: cartItems[index]),
        );
      },
    );
  }
}
