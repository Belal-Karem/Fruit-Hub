import 'package:flutter/material.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/rating_bar_item.dart';

class RatingBarListView extends StatelessWidget {
  const RatingBarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: RatingBarItem(textNumber: (index + 1).toString(), value: 0.8),
        );
      },
    );
  }
}
