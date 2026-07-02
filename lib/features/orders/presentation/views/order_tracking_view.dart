import 'package:flutter/material.dart';
import 'package:fruit_hub/features/orders/presentation/views/widgets/order_tracking_view_body.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});

  static const String routeName = 'order_tracking_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrderTrackingViewBody());
  }
}
