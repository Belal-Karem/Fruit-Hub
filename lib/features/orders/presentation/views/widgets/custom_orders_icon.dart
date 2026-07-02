import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomOrdersIcon extends StatelessWidget {
  const CustomOrdersIcon({super.key, required this.iconPath, this.color});

  final String iconPath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 66,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: color ?? const Color(0xFFEBF9F1),
        shape: OvalBorder(),
      ),
      child: SvgPicture.asset(iconPath),
    );
  }
}
