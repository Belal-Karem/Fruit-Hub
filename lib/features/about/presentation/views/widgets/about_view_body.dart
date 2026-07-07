import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/about/domain/entites/about_entity.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key, required this.about});

  final AboutEntity about;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(
                  context: context,
                  title: 'من نحن',
                  showNotification: false,
                ),
                const SizedBox(height: 16),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.white,
                  elevation: 0.2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      about.aboutText,
                      style: AppTextStyle.semiBold13,
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
