import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32,
      child: Container(
        height: 500,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Image.asset("assets/images/AuthPhoto2.jpg", fit: BoxFit.fill),
      ),
    );
  }
}
