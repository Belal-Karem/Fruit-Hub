import 'package:flutter/material.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/rating_bar_list_view.dart';

import '../../../../../core/utils/theme/app_text_style.dart';

class RatingBarsecation extends StatelessWidget {
  const RatingBarsecation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.star, weight: 16, color: const Color(0xffFFB400)),
                  const SizedBox(width: 8),
                  Text('4.5', style: AppTextStyle.bold13),
                ],
              ),
              const SizedBox(height: 20),
              Text('88%', style: AppTextStyle.semiBold16),
              const SizedBox(height: 4),
              Text(
                'موصي بها',
                style: AppTextStyle.regular13.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: RatingBarListView()),
      ],
    );
  }
}
