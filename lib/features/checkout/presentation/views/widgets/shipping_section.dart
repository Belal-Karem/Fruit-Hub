import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int isSelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        ShippingItem(
          onTap: () {
            setState(() {
              isSelectedIndex = 1;
              orderEntity.payWithCash = true;
            });
          },
          isSelected: isSelectedIndex == 1,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: (orderEntity.cartEntity.calculatedTotalPrice() + 40)
              .toString(),
        ),
        const SizedBox(height: 8),
        ShippingItem(
          onTap: () {
            setState(() {
              isSelectedIndex = 2;
              orderEntity.payWithCash = false;
            });
          },
          isSelected: isSelectedIndex == 2,
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: orderEntity.cartEntity.calculatedTotalPrice().toString(),
        ),
      ],
    );
  }
}
