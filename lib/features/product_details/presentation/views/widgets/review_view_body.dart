import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/rating_bar_section.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/review_card.dart';

class ReviewViewBody extends StatelessWidget {
  const ReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(
                  context: context,
                  title: 'المراجعه',
                  showNotification: false,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: 'اكتب التعليق..',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                Text('324 مراجعه', style: AppTextStyle.bold13),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Text('الملخص', style: AppTextStyle.semiBold16),
                ),
                RatingBarsecation(),
                const SizedBox(height: 16),
                ReviewCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
