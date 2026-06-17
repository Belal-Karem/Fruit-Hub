import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItems});

  static const String routeName = 'checkout';
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'الشحن',
        showNotification: false,
      ),
      body: CheckoutViewBody(),
    );
  }
}
