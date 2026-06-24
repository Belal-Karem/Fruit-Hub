import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub/core/widgets/custom_modal_progress_hud.dart';

import '../../manager/order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      builder: (context, state) => CustomModalProgressHUD(
        isLoading: state is AddOrderLoading,
        child: child,
      ),
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showErrorBar(context, 'تم اضافة الطلب بنجاح');
        }
      },
    );
  }
}
