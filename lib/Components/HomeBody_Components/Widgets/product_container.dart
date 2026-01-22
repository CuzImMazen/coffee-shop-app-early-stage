import 'package:coffe_shop/models/product.dart';
import 'package:coffe_shop/pages/product_detail_page.dart';
import 'package:coffe_shop/services/favorites_service.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductContainer extends StatefulWidget {
  const ProductContainer({required this.product});
  final Product product;

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  FavoritesService favoritesService = FavoritesService();
  checkIfProductIsFavorite() async {
    isFavourite = await favoritesService.checkIfFavorite(widget.product.id);
  }

  bool isFavourite = false;

  @override
  void initState() {
    checkIfProductIsFavorite();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetialPage(
                product: widget.product,
                //isFavorite: isFavourite,
              ),
            ),
          );
        },
        child: Container(
          color: Colors.transparent,

          width: 170,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${widget.product.rate}",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(IconlyBold.star, color: Colors.yellow),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  widget.product.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Sora",

                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
                      r"$" + " " + widget.product.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Sora",
                      ),
                    ),
                    Spacer(),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffc47c51),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
