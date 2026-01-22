import 'package:coffe_shop/Components/HomeBody_Components/Widgets/product_container.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
    required this.scrollController,
  });
  final ScrollController scrollController;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ProductContainer(product: products[index]);
        },
      ),
    );
  }
}
