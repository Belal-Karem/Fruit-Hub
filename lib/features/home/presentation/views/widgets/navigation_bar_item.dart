import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/in_active_item.dart';

import '../../../domain/entites/botton_navigation_bar_entity.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottonNavigationBarEntity,
  });

  final bool isSelected;
  final BottonNavigationBarEntity bottonNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottonNavigationBarEntity.activeItem,
            name: bottonNavigationBarEntity.name,
          )
        : InActiveItem(image: bottonNavigationBarEntity.inActiveItem);
  }
}
