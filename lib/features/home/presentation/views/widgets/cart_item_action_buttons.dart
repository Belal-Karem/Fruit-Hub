import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_item/cart_item_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartCAtionButton(
          icon: Icons.add,
          color: AppColor.primaryColor,
          onPressed: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
        const SizedBox(width: 16),
        Text(
          '${cartItemEntity.count}',
          textAlign: TextAlign.center,
          style: AppTextStyle.bold16,
        ),
        const SizedBox(width: 16),
        CartCAtionButton(
          icon: Icons.remove,
          iconColor: const Color(0xff979899),
          color: const Color(0xFFF3F5F7),
          onPressed: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
      ],
    );
  }
}
