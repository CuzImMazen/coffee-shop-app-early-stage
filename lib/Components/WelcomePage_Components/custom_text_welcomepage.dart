import 'package:flutter/material.dart';

class CustomTextWelcomePage extends StatelessWidget {
  CustomTextWelcomePage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36,
        color: Colors.white,
        fontFamily: 'Sora',
      ),
    );
  }
}
