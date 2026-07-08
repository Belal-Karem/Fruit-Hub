import 'package:flutter/material.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/review_view_body.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  static const routeName = 'ReviewView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ReviewViewBody());
  }
}
