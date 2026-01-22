import 'package:coffe_shop/Components/HomeBody_Components/Widgets/products_gridview.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:coffe_shop/services/favorites_service.dart';
import 'package:coffe_shop/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductStreamGridView extends StatelessWidget {
  const ProductStreamGridView({
    super.key,
    required this.categoryIndex,
    required this.scrollController,
  });
  final int categoryIndex;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ProductService().getProductsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> allProducts = snapshot.data!;

          List<Product> filtredProducts;

          switch (categoryIndex) {
            case 0:
              return ProductsGridView(
                products: allProducts,
                scrollController: scrollController,
              );
            case 1:
              filtredProducts = allProducts
                  .where((element) => element.category == "Coffee")
                  .toList();
              return ProductsGridView(
                products: filtredProducts,
                scrollController: scrollController,
              );

            case 2:
              filtredProducts = allProducts
                  .where((element) => element.category == "Tea")
                  .toList();
              return ProductsGridView(
                products: filtredProducts,
                scrollController: scrollController,
              );
            case 3:
              filtredProducts = allProducts
                  .where((element) => element.category == "Latte")
                  .toList();
              return ProductsGridView(
                products: filtredProducts,
                scrollController: scrollController,
              );

            default:
              return ProductsGridView(
                products: allProducts,
                scrollController: scrollController,
              );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(color: Color((0xffc97a54))),
          );
        }
      },
    );
  }
}
