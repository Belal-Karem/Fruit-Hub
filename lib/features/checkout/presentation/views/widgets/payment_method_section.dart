import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_decorations.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/in_active_payment_method.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_methods.dart';

import '../../../domain/entites/order_entity.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var payWithCash = context.read<OrderEntity>().payWithCash;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('أختار طريقه الدفع المناسبه :', style: AppTextStyle.bold13),
        const SizedBox(height: 13),
        Text(
          'من فضلك اختر طريقه الدفع المناسبه لك.',
          style: AppTextStyle.regular13,
        ),
        const SizedBox(height: 13),
        PaymentMethods(
          onChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        const SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(8),
          decoration: AppDecorations.grayBoxDecoration,
          child: Row(
            children: [
              payWithCash == true
                  ? InActivePaymentMethod(imagePath: getPaymentMethods()[3])
                  : InActivePaymentMethod(
                      imagePath: getPaymentMethods()[currentIndex],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
