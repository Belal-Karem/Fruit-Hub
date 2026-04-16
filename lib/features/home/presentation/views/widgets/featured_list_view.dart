import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FeaturedItem(),
          );
        },
      ),
    );
  }
}
