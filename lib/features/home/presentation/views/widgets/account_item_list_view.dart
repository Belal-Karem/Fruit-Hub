import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entites/accoun_item.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/account_item.dart';

class AccountItemListView extends StatelessWidget {
  const AccountItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: getAccountItemList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 8),
            AccountItem(item: getAccountItemList[index]),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}
