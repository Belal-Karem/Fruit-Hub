import 'package:flutter/material.dart';
import '../../../domain/entites/botton_navigation_bar_entity.dart';
import 'navigation_bar_item.dart';

class CustomBottonNavigationBar extends StatefulWidget {
  const CustomBottonNavigationBar({super.key});

  @override
  State<CustomBottonNavigationBar> createState() =>
      _CustomBottonNavigationBarState();
}

class _CustomBottonNavigationBarState extends State<CustomBottonNavigationBar> {
  int isSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: getBottonNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return NavigationBarItem(
            isSelected: isSelectedIndex == index,
            bottonNavigationBarEntity: entity,
          );
        }).toList(),
      ),
    );
  }
}
