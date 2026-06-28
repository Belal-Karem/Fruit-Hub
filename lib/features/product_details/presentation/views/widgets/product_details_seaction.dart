import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/product_info_cards.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_text_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/cart_item_action_buttons.dart';
import '../../../../../core/cubits/cart_cubit/cart_cubit.dart';

class ProductDetailsSection extends StatefulWidget {
  const ProductDetailsSection({super.key});

  @override
  State<ProductDetailsSection> createState() => _ProductDetailsSectionState();
}

class _ProductDetailsSectionState extends State<ProductDetailsSection> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    var product = context.read<ProductEntity>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          trailing: CartItemActionButtons(
            quantity: quantity,
            increaseQuantity: () => setState(() => quantity++),
            decreaseQuantity: () => setState(() => quantity--),
          ),
          title: Text(product.name, style: AppTextStyle.bold16),
          subtitle: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${product.price}جنية ',
                  style: AppTextStyle.bold13.copyWith(
                    color: AppColor.secondaryColor,
                  ),
                ),
                TextSpan(
                  text: '/الكيلو',
                  style: AppTextStyle.semiBold13.copyWith(
                    color: const Color(0xFFF8C76D),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.star, color: const Color(0xffFFC529)),
            const SizedBox(width: 2.5),
            Text(product.avgRating.toString(), style: AppTextStyle.semiBold13),
            const SizedBox(width: 9),
            Text('(${product.ratingCount})', style: AppTextStyle.regular13),
            const SizedBox(width: 9),
            Text(
              'المراجعه',
              style: AppTextStyle.bold13.copyWith(
                decoration: TextDecoration.underline,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(product.description, style: AppTextStyle.regular13),
        const SizedBox(height: 16),
        ProductInfoCards(),
        CustomButton(
          text: 'أضف الي السلة',
          onPressed: () {
            context.read<CartCubit>().addCartItem(product, quantity: quantity);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
