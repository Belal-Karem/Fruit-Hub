import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/addres_input_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_method_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/order_review_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

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

  List<Widget> getPage() => [
    ShippingSection(),
    PaymentMethodSection(),
    AddresInputSection(formKey: formKey, valueListenable: valueListenable),

    OrderReviewsection(),
  ];
}
