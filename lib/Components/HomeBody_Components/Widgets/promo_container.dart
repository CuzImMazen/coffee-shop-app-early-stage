import 'package:flutter/material.dart';

class PromoContainer extends StatelessWidget {
  const PromoContainer({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
