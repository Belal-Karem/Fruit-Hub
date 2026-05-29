import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductAdded) {
          buildErrorBar(context, 'تم اضافة المنتج الى السلة');
        }
        if (state is CartItemRemoved) {
          buildErrorBar(context, 'تم حذف المنتج من السلة');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
