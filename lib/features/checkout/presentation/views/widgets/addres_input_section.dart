import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

import 'switch_save_address.dart';

class AddresInputSection extends StatelessWidget {
  const AddresInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'رقم الجوال',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'العنوان',
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'المدينه',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          SwitchSaveAddress(),
        ],
      ),
    );
  }
}
