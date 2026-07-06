import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/orders/presentation/manager/orders_cubit/orders_cubit.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          buildAppBar(
            context: context,
            title: 'طلباتي',
            showNotification: false,
          ),
          Expanded(child: OrdersListViewBlocBuilder()),
        ],
      ),
    );
  }
}

class OrdersListViewBlocBuilder extends StatelessWidget {
  const OrdersListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersSuccess) {
          return Expanded(child: OrderListView(orders: state.ordersEntityList));
        } else if (state is OrdersFailure) {
          // showErrorBar(context, state.message);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
        // showErrorBar(context, 'حدث خطأ ما');
        return SizedBox();
      },
    );
  }
}
