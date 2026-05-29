import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item_list.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/build_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                    showBackButton: true,
                    showNotification: false,
                  ),
                  const SizedBox(height: 16),
                  CartHeader(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : CustomDivider(),
            ),
            CartItemList(cartItems: []),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(text: 'الدفع  120جنيه', onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
