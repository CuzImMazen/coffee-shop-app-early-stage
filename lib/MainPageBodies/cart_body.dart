import 'package:coffe_shop/Components/CartBodyComponents/CartItemContainer.dart';
import 'package:coffe_shop/Components/CartBodyComponents/CartTextRow.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cart",
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: "Sora",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            CartItemContainer(
              product: Product(
                id: "100",
                name: "test",
                description: "test",
                title: "test",
                image:
                    "https://jussquznoyzwghilbbvc.supabase.co/storage/v1/object/public/products_images/latte.jpg",
                price: 22,
                category: "test",
                rate: 2,
              ),
            ),
            SizedBox(height: 150),
            CartTextRow(
              text: "Subtotal",
              price: "22",
              fontWeight: FontWeight.normal,
            ),
            SizedBox(height: 20),
            CartTextRow(
              text: "Delivery Charge",
              price: "2",
              fontWeight: FontWeight.normal,
            ),
            SizedBox(height: 20),
            Divider(thickness: 2),
            SizedBox(height: 10),
            CartTextRow(
              text: "Total",
              price: "24",
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffc67c4f),
                ),
                child: Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Sora",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
