import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key});

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
                      style: AppTextStyle.semiBold13,
                      'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص`',
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
