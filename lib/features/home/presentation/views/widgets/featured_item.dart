import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:svg_flutter/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: itemWidth * 0.4,
                child: SvgPicture.asset(Assets.imagesLogo, fit: BoxFit.fill),
              ),
              Container(
                width: itemWidth * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: svg.Svg(Assets.imagesFeaturedItem),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        'عروض العيد',
                        style: AppTextStyle.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'خصم 25%',
                        style: AppTextStyle.bold19.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 7),
                      FeaturedItemButton(),
                      const SizedBox(height: 29),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
