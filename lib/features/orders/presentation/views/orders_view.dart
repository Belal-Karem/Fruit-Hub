import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/orders/presentation/manager/orders_cubit/orders_cubit.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/orders_view_body.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/repo/orders_repo.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const String routeName = 'orders_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(getIt.get<OrdersRepo>())..getOrders(),
      child: Scaffold(body: OrdersViewBody()),
    );
  }
}
