import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/account_header.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              buildAppBar(
                context: context,
                title: 'حسابي',
                showBackButton: false,
                showNotification: false,
              ),
              AccountHeader(),
            ],
          ),
        ),
      ],
    );
  }
}
