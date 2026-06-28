import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  static const routeName = 'itemDetailsView';
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: product,
        child: ProductDetailsViewBody(product: product),
      ),
    );
  }
}
