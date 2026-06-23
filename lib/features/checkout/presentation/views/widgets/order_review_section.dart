import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_methods.dart';
import '../../../../../core/utils/theme/app_text_style.dart';
import 'address_summry_widget.dart';
import 'oredr_summry_widget.dart';

class OrderReviewsection extends StatelessWidget {
  const OrderReviewsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('أختار طريقه الدفع المناسبه :', style: AppTextStyle.bold13),
        const SizedBox(height: 13),
        PaymentMethods(onChange: (index) {}),
        const SizedBox(height: 16),
        OrderSummryWidget(),
        const SizedBox(height: 16),
        AddressSummrywidget(),
      ],
    );
  }
}
