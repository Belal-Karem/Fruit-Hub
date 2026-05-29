import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

import '../entites/product_entity.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.fruitItemColor,
        borderRadius: BorderRadius.circular(4),
      ),

      child: Stack(
        children: [
          Positioned(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),

                product.imageUrl != null
                    ? Flexible(
                        child: CustomNetworkImage(imageUrl: product.imageUrl!),
                      )
                    : Container(color: Colors.grey, width: 100, height: 100),
                const SizedBox(height: 24),
                ListTile(
                  title: Text(product.name, style: AppTextStyle.semiBold13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${product.price} جنيه',
                          style: AppTextStyle.bold13.copyWith(
                            color: AppColor.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyle.semiBold13.copyWith(
                            color: AppColor.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style: AppTextStyle.semiBold13.copyWith(
                            color: AppColor.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addCartItem(product);
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
