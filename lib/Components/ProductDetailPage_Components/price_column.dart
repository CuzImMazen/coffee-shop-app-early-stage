import 'package:coffe_shop/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class PriceColumn extends StatelessWidget {
  const PriceColumn({
    super.key,
    required this.widget,
    required this.selectedIndexSize,
    required this.quantity,
  });

  final ProductDetialPage widget;
  final int selectedIndexSize;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          "Price",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Sora',
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              r"$",
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Sora',
                fontWeight: FontWeight.bold,
                color: Color(0xffc67c4f),
              ),
            ),
            SizedBox(width: 5),
            Text(
              switch (selectedIndexSize) {
                0 => ((widget.product.price / 2) * quantity).toStringAsFixed(2),
                1 => ((widget.product.price) * quantity).toStringAsFixed(2),
                2 =>
                  (((widget.product.price * 1.5)) * quantity).toStringAsFixed(
                    2,
                  ),
                _ => widget.product.price.toString(),
              },
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Sora',
                color: Color(0xffc67c4f),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
