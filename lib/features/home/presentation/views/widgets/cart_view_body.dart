import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/build_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
                  showBackButton: true,
                  showNotification: false,
                ),
                const SizedBox(height: 16),
                CartHeader(),
                const SizedBox(height: 24),
                CartItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
