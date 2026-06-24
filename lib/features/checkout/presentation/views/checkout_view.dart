import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/get_user.dart';
import 'package:fruit_hub/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: 'الشحن',
          showNotification: false,
        ),
        body: MultiProvider(
          providers: [
            Provider.value(
              value: OrderEntity(uId: getUserData().uId!, cartEntity),
            ),
            ListenableProvider<PageController>(
              create: (context) => PageController(),
              dispose: (context, controller) => controller.dispose(),
            ),
          ],
          child: CheckoutViewBody(),
        ),
      ),
    );
  }
}
