import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/theme/app_color.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

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

                Image.asset(Assets.imagesWeatermelonTest),
                const SizedBox(height: 24),
                ListTile(
                  title: Text('بطيخ', style: AppTextStyle.semiBold13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '20جنية ',
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
                  trailing: const CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
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
