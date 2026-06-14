import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getPage().length,
        itemBuilder: (context, index) {
          return getPage()[index];
        },
      ),
    );
  }
}

List<Widget> getPage() => const [
  ShippingSection(),
  SizedBox(),
  SizedBox(),
  SizedBox(),
];
