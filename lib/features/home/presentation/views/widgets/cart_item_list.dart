import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item.dart';

import '../../../../../constants.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => CustomDivider(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CartItem(),
        );
      },
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Color(0xFFF1F1F5), height: 25);
  }
}
