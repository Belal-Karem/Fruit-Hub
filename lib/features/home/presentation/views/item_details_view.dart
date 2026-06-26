import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  static const routeName = 'itemDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ItemDetailsViewBody());
  }
}
