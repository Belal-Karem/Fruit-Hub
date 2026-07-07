import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/favorit/presentation/views/widgets/favorit_grid_view_bloc_builder.dart';

import '../../../../../constants.dart';

class FavoritViewBody extends StatelessWidget {
  const FavoritViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          buildAppBar(
            context: context,
            title: 'المفضلة',
            showNotification: false,
          ),
          Expanded(child: FavoritGridViewBlocBuilder()),
        ],
      ),
    );
  }
}
