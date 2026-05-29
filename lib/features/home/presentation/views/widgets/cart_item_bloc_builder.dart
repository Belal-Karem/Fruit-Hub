import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_item/cart_item_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item.dart';

class CartItemBlocBuilder extends StatelessWidget {
  const CartItemBlocBuilder({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUbdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return CartItem(cartItemEntity: cartItemEntity);
      },
    );
  }
}
