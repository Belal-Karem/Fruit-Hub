import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/in_active_payment_method.dart';

import '../../../domain/entites/order_entity.dart';
import 'active_payment_method.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

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
        if (activeIndex == index) {
          context.read<OrderEntity>().paymentMethod =
              getPaymentMethods()[activeIndex!]['name'];
        }
        return GestureDetector(
          onTap: () {
            setState(() {
              activeIndex = index;

              payWithCash.payWithCash = index == 4;
              activeIndex == 4
                  ? payWithCash.payWithCash = true
                  : payWithCash.payWithCash = false;
            });
          },
          child: activeIndex == index
              ? ActivePaymentMethod(
                  imagePath: getPaymentMethods()[index]['imagePath'],
                )
              : InActivePaymentMethod(
                  imagePath: getPaymentMethods()[index]['imagePath'],
                ),
        );
      }),
    );
  }
}

List<Map<String, dynamic>> getPaymentMethods() => [
  {'imagePath': Assets.imagesApplePay, 'name': 'Apple Pay'},
  {'imagePath': Assets.imagesPaypal, 'name': 'Paypal'},
  {'imagePath': Assets.imagesMastercard, 'name': 'Mastercard'},
  {'imagePath': Assets.imagesVisa, 'name': 'Visa'},
  {'imagePath': Assets.imagesCashPayment, 'name': 'Cash Payment'},
];
