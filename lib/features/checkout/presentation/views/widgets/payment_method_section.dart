import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_methods.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
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
        PaymentMethods(),
        const SizedBox(height: 16),
        CustomTextFormField(
          hintText: 'اسم حامل البطاقه',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: 'رقم البطاقة',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: 'تاريخ الصلاحيه',
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextFormField(
                hintText: 'CVV',
                keyboardType: TextInputType.text,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
