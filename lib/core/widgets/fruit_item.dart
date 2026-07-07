import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';
import 'package:fruit_hub/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/favorit/domain/repo/favorit_repo.dart';

import '../../features/favorit/presentation/manager/cubit/favorit_cubit.dart';
import '../../features/home/presentation/views/widgets/favorit_icon_bloc_builder.dart';
import '../../features/product_details/presentation/views/item_details_view.dart';
import '../entites/product_entity.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsView.routeName,
          arguments: product,
        );
      },
      child: BlocProvider(
        create: (context) => FavoritCubit(getIt<FavoritRepo>()),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.fruitItemColor,
            borderRadius: BorderRadius.circular(4),
          ),

          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    product.imageUrl != null
                        ? Flexible(
                            child: CustomNetworkImage(
                              imageUrl: product.imageUrl!,
                            ),
                          )
                        : Container(
                            color: Colors.grey,
                            width: 100,
                            height: 100,
                          ),
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
              Positioned(child: FavoritIconBlocBuilder(product: product)),
            ],
          ),
        ),
      ),
    );
  }
}
