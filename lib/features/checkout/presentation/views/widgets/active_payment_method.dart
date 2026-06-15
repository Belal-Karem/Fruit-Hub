import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class ActivePaymentMethod extends StatelessWidget {
  const ActivePaymentMethod({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 67,
      height: 43,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: const Color(0xFFD6DCE5),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 3,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(imagePath),
      ),
    );
  }
}
