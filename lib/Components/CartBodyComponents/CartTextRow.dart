import 'package:flutter/material.dart';

class CartTextRow extends StatelessWidget {
  const CartTextRow({
    required this.text,
    required this.price,
    required this.fontWeight,
    super.key,
  });
  final String text;
  final String price;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Sora",
              fontWeight: fontWeight,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                r"$",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Sora",
                  fontWeight: fontWeight,
                ),
              ),
              SizedBox(width: 2),
              Text(
                price,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Sora",
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
