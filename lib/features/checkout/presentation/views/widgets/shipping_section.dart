import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '40 جنيه',
        ),
        const SizedBox(height: 8),
        ShippingItem(
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: 'مجاني',
        ),
      ],
    );
  }
}
