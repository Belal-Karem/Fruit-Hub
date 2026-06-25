import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_cart_button.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../checkout/presentation/views/checkout_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = context.read<CartCubit>().cartEntity.cartItems.isEmpty;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: kTopPadding),
                  buildAppBar(
                    context: context,
                    title: 'المنتجات',
                    showBackButton: false,
                    showNotification: false,
                  ),
                  const SizedBox(height: 16),
                  CartHeader(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: isEmpty ? const SizedBox() : CustomDivider(),
            ),
            CartItemList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: isEmpty ? const SizedBox() : CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Visibility(
              visible: !isEmpty,
              child: CustomCartButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CheckoutView.routeName,
                    arguments: context.read<CartCubit>().cartEntity,
                  );
                },
                text:
                    'الدفع  ${context.watch<CartCubit>().cartEntity.calculatedTotalPrice()}جنيه',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
