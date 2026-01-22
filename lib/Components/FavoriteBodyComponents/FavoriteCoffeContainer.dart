import 'package:coffe_shop/cubits/FavoriteCubit/favorite_cubit.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:coffe_shop/pages/product_detail_page.dart';
import 'package:coffe_shop/services/favorites_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class FavoriteCoffeContainer extends StatelessWidget {
  const FavoriteCoffeContainer({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetialPage(product: product),
          ),
        ),
        child: Container(
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
              Container(
                margin: const EdgeInsets.only(right: 16),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleFavorite(product.id);
                    },
                    icon: Icon(IconlyBold.heart, color: Color(0xffc87b4b)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
