import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_text_style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../domain/entites/cart_item_entity.dart';
import '../../../../../core/cubits/cart_cubit/cart_cubit.dart';
import '../../manager/cart_item/cart_item_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
            child: CustomNetworkImage(
              imageUrl: cartItemEntity.productEntity.imageUrl!,
            ),
          ),
          SizedBox(width: 17),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.name,
                      style: AppTextStyle.bold13,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().deleteCartItem(
                          cartItemEntity,
                        );
                      },
                      child: SvgPicture.asset(Assets.imagesTrashIcon),
                    ),
                  ],
                ),
                Text(
                  '${cartItemEntity.calculatedTotalWeight()} كم',
                  textAlign: TextAlign.right,
                  style: AppTextStyle.regular13.copyWith(
                    color: AppColor.secondaryColor,
                  ),
                ),
                Row(
                  children: [
                    CartItemActionButtons(
                      quantity: cartItemEntity.quantity,
                      decreaseQuantity: () {
                        cartItemEntity.decreaseQuantity();
                        context.read<CartItemCubit>().updateCartItem(
                          cartItemEntity,
                        );
                      },
                      increaseQuantity: () {
                        cartItemEntity.increaseQuantity();
                        context.read<CartItemCubit>().updateCartItem(
                          cartItemEntity,
                        );
                      },
                    ),
                    const Spacer(),
                    Text(
                      '${cartItemEntity.calculatedtotalPrice()} جنيه',
                      style: AppTextStyle.bold16.copyWith(
                        color: AppColor.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
