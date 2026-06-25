import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/addres_input_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/order_review_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/order_successfull_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: PageView.builder(
        controller: context.read<PageController>(),
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
    AddresInputSection(formKey: formKey, valueListenable: valueListenable),
    OrderReviewsection(),
    OrderSuccessfullSection(),
  ];
}
