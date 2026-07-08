import 'package:flutter/material.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.value});

  final double value; // من 0 إلى 1

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x7FE4E6E7),
        borderRadius: BorderRadius.circular(2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFB400),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
