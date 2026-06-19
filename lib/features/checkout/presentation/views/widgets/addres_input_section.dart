import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';

import 'switch_save_address.dart';

class AddresInputSection extends StatelessWidget {
  const AddresInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.name =
                      value!;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.phone =
                      value!;
                },
                hintText: 'رقم الجوال',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.email =
                      value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.address =
                      value!;
                },
                hintText: 'العنوان',
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.city =
                      value!;
                },
                hintText: 'المدينه',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context
                          .read<OrderEntity>()
                          .shippingAddressEntity!
                          .floorNumber =
                      value!;
                },
                hintText: 'رقم الطابق , رقم الشقه ..',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              SwitchSaveAddress(),
            ],
          ),
        ),
      ),
    );
  }
}
