import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/account_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/account_item_list_view.dart';

import '../../../../../constants.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

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
                  title: 'حسابي',
                  showBackButton: false,
                  showNotification: false,
                ),
                AccountHeader(),
                const SizedBox(height: 16),
                Text('عام', style: AppTextStyle.semiBold13),
                const SizedBox(height: 16),
              ],
            ),
          ),
          AccountItemListView(),
        ],
      ),
    );
  }
}
