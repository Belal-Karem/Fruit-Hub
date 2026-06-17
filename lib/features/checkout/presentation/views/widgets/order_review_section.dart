import 'package:flutter/material.dart';
import 'address_summry_widget.dart';
import 'oredr_summry_widget.dart';
import 'payment_summry_widget.dart';

class OrderReviewsection extends StatelessWidget {
  const OrderReviewsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderSummryWidget(),
        const SizedBox(height: 16),
        PaymentSummryWidget(),
        AddressSummrywidget(),
      ],
    );
  }
}
