import 'package:coffe_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';

class CartItemContainer extends StatelessWidget {
  const CartItemContainer({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withAlpha(75),
      ),
      child: Row(
        children: [
          SizedBox(width: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
            height: 76,
            width: 76,
          ),
          SizedBox(width: 25),
          SizedBox(
            height: 76,
            //text column
            child: Column(
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Sora",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.title,
                  style: TextStyle(fontSize: 15, fontFamily: "Sora"),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      r"$",
                      style: TextStyle(
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      product.price.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(IconlyLight.delete),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  height: 40,

                  decoration: BoxDecoration(
                    color: Color(0xffc67c4f),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove, color: Colors.white),
                      ),

                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Sora",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
