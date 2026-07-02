import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/theme/app_text_style.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/account_header_bloc_builder.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/account_item_list_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/signout_button.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../constants.dart';
import '../../../../auth/presentation/views/login_view.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
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
                    AccountHeaderBlocBuilder(),
                    const SizedBox(height: 16),
                    Text('عام', style: AppTextStyle.semiBold13),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              AccountItemListView(),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 22),
                    Text('المساعده', style: AppTextStyle.semiBold13),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.imagesInfoCircleIcon),
                        const SizedBox(width: 7),
                        Text(
                          'من نحن',
                          style: AppTextStyle.semiBold13.copyWith(
                            color: const Color(0xFF949D9E),
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(Assets.imagesArrowRight),
                      ],
                    ),
                    CustomDivider(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          child: SignoutButton(
            onTap: () {
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
          ),
        ),
      ],
    );
  }
}
