import 'package:flutter/material.dart';

class CustomWelcomePageButton extends StatelessWidget {
  CustomWelcomePageButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 300,
        child: Center(
          child: Text(
            "Get Started",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Sora',
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xffc67c4f),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
