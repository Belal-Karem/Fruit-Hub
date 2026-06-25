import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entites/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/manager/order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_key.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  final GlobalKey<FormState> formKey = GlobalKey();
  ValueNotifier<AutovalidateMode> autovalidateMode =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);
  int currentPageindex = 0;

  @override
  void initState() {
    super.initState();
    pageController = context.read<PageController>();
    pageController.addListener(() {
      currentPageindex = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 16),
          CheckoutSteps(
            currentPageIndex: currentPageindex,
            onTap: (index) {
              if (index == 0) {
                context.read<PageController>().animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else if (index == 1) {
                if (context.read<OrderEntity>().payWithCash != null) {
                  context.read<PageController>().animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  showErrorBar(context, 'اختر طريقة الدفع');
                }
              } else {
                handleAddressSecionValidation();
              }
            },
          ),
          Expanded(
            child: CheckoutStepsPageView(
              valueListenable: autovalidateMode,
              formKey: formKey,
            ),
          ),
          CustomButton(
            text: getNextButtonText(currentPageindex),
            onPressed: () {
              if (currentPageindex == 0) {
                handleShippingSecionValidation(context);
              } else if (currentPageindex == 1) {
                handleAddressSecionValidation();
              } else {
                processPayment(context);
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void handleAddressSecionValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPageindex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      autovalidateMode.value = AutovalidateMode.always;
    }
  }

  void handleShippingSecionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageindex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      showErrorBar(context, 'اختر طريقة الدفع');
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'تأكيد و استمرار';
      case 3:
        return 'تأكيد الطلب';
      default:
        return 'التالي';
    }
  }
}

void processPayment(BuildContext context) {
  var order = context.read<OrderEntity>();
  PaypalPaymentEntity payment = PaypalPaymentEntity.fromEntity(
    orderEntity: order,
  );
  var addOrderCubit = context.read<AddOrderCubit>();
  log(payment.toJson().toString());
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: kPaypalClientId,
        secretKey: kPaypalSecretKey,
        transactions: [payment.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
          addOrderCubit.addOrder(order);
        },
        onError: (error) {
          log("onError: $error");
          showErrorBar(context, error.toString());
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ),
  );
}
