import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text('Ahmed Amr', style: AppTextStyle.semiBold16),
                const SizedBox(width: 5.5),
                Text('25/06/2020', style: AppTextStyle.regular13),
              ],
            ),
            const SizedBox(width: 15.5),
            ReviewImageCart(),
          ],
        ),
        const SizedBox(height: 17.5),
        Text(
          'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
          textAlign: TextAlign.right,
          style: AppTextStyle.regular13,
        ),
      ],
    );
  }
}

class ReviewImageCart extends StatelessWidget {
  const ReviewImageCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(Assets.imagesProfileImage, width: 50),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 19.24,
            height: 19.28,
            decoration: BoxDecoration(
              color: const Color(0xffFFC529),
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffFFC529),
                  spreadRadius: 0,
                  blurRadius: 9,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '5.0',
                textAlign: TextAlign.center,
                style: AppTextStyle.bold13.copyWith(
                  fontSize: 11,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
