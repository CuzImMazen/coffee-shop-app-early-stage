import 'package:flutter/material.dart';

class CustomSubTextWelcomePage extends StatelessWidget {
  CustomSubTextWelcomePage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, fontFamily: 'Sora', color: Colors.grey),
    );
  }
}
