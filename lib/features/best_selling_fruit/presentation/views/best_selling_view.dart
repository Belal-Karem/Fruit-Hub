import 'package:flutter/material.dart';
import 'package:fruit_hub/features/best_selling_fruit/presentation/views/widgets/best_selling_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const String routeName = 'best_selling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'الأكثر مبيعًا', context),
      body: BestSellingViewBody(),
    );
  }
}
