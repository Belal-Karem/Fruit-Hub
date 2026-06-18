import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_item/cart_item_cubit.dart';

import '../../../../../core/widgets/custom_button.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(text: text, onPressed: onPressed);
      },
    );
  }
}
