import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

import 'switch_save_address.dart';

class AddresInputSection extends StatelessWidget {
  const AddresInputSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>().shippingAddressEntity!;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) {
              orderEntity.name = value!;
            },
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            onSaved: (value) {
              orderEntity.phone = value!;
            },
            hintText: 'رقم الجوال',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            onSaved: (value) {
              orderEntity.email = value!;
            },
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            onSaved: (value) {
              orderEntity.address = value!;
            },
            hintText: 'العنوان',
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            onSaved: (value) {
              orderEntity.city = value!;
            },
            hintText: 'المدينه',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            onSaved: (value) {
              orderEntity.floorNumber = value!;
            },
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
