import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/item_details_view_body.dart';
import 'package:provider/provider.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.product});

  static const routeName = 'itemDetailsView';
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(value: product, child: ItemDetailsViewBody()),
    );
  }
}
