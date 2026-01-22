import 'package:flutter/material.dart';

class CustomTabText extends StatelessWidget {
  const CustomTabText({
    required this.color,
    required this.fontWeight,
    required this.text,
  });
  final Color color;
  final FontWeight fontWeight;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 30,
        fontFamily: 'Sora',
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
