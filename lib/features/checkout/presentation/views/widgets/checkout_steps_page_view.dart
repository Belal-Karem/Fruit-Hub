import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/addres_input_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: PageView.builder(
        controller: pageController,
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
  AddresInputSection(),
  SizedBox(),
  SizedBox(),
];
