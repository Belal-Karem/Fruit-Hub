import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/widgets/custom_back_icon.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_images.dart';

class ProductHeroSection extends StatelessWidget {
  const ProductHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Stack(
        children: [
          Positioned(top: 40, child: CustomBackIcon()),
          Positioned.fill(
            top: 0,
            child: SvgPicture.asset(
              Assets.imagesItemDetailsShape,
              fit: BoxFit.fill,
            ),
          ),

          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomNetworkImage(
              imageUrl: context.read<ProductEntity>().imageUrl!,
            ),
          ),
          Positioned(top: 40, child: CustomBackIcon()),
        ],
      ),
    );
  }
}
