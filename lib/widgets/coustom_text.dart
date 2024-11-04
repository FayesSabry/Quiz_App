import 'package:flutter/material.dart';

class CoustomText extends StatelessWidget {
  const CoustomText(
      {super.key,
      required this.text,
      required this.color,
      required this.fSize});
  final String text;
  final Color color;
  final double fSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          color: color,
          fontSize: fSize,
        ),
      ),
    );
  }
}
