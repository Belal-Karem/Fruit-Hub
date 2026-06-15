import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/in_active_payment_method.dart';

import 'active_payment_method.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(getPaymentMethods().length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              activeIndex = index;
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
];
