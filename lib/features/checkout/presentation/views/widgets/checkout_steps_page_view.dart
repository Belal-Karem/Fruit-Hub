import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getSteps().length,
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
