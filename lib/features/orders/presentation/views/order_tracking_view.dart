import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/domain/entites/orders_entity.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_tracking_view_body.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key, required this.order});

  final OrdersEntity order;
  static const String routeName = 'order_tracking_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrderTrackingViewBody(order: order));
  }
}
