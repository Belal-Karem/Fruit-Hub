import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_item/cart_item_cubit.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          text:
              'الدفع  ${context.watch<CartCubit>().cartEntity.calculatedTotalPrice()}جنيه',
          onPressed: () {
            Navigator.pushNamed(
              context,
              CheckoutView.routeName,
              arguments: context.read<CartCubit>().cartEntity.cartItems,
            );
          },
        );
      },
    );
  }
}
