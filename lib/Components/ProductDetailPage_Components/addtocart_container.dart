import 'package:flutter/material.dart';

class AddToCartContainer extends StatelessWidget {
  const AddToCartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Add to cart",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Sora',
            color: Colors.white,
          ),
        ),
      ),
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        color: Color(0xffc67c4f),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
