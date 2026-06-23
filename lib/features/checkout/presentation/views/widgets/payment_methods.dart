import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/in_active_payment_method.dart';

import '../../../domain/entites/order_entity.dart';
import 'active_payment_method.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int? activeIndex;

  @override
  Widget build(BuildContext context) {
    var payWithCash = context.watch<OrderEntity>();
    if (payWithCash.payWithCash!) {
      activeIndex = 4;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(getPaymentMethods().length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              activeIndex = index;
              widget.onChange(index);
              payWithCash.payWithCash = index == 4;
              activeIndex == 4
                  ? payWithCash.payWithCash = true
                  : payWithCash.payWithCash = false;
            });
          },
          child: activeIndex == index
              ? ActivePaymentMethod(imagePath: getPaymentMethods()[index])
              : InActivePaymentMethod(imagePath: getPaymentMethods()[index]),
        );
      }),
    );
  }
}

List<String> getPaymentMethods() => [
  Assets.imagesApplePay,
  Assets.imagesPaypal,
  Assets.imagesMastercard,
  Assets.imagesVisa,
  Assets.imagesCashPayment,
];
