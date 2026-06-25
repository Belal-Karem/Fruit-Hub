import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/main_view.dart';
import 'package:svg_flutter/svg.dart';

class OrderSuccessfullSection extends StatelessWidget {
  const OrderSuccessfullSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 67),
        SvgPicture.asset(Assets.imagesSuccessfullOrder),
        const SizedBox(height: 33),
        Text('تم بنجاح !', style: AppTextStyle.bold16),
        const SizedBox(height: 9),
        Text(
          'رقم الطلب : ${context.read<OrderEntity>().orderNumber}#',
          style: AppTextStyle.regular13,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
        CustomButton(text: 'تتبع الطلب'),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, MainView.routeName);
          },
          child: Text(
            'الرئيسية',
            textAlign: TextAlign.center,

            style: AppTextStyle.bold16.copyWith(
              decoration: TextDecoration.underline,
              color: const Color(0xFF1B5E37),
            ),
          ),
        ),
      ],
    );
  }
}
