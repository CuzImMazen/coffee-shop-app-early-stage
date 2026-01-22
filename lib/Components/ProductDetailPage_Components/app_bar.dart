import 'package:coffe_shop/cubits/FavoriteCubit/favorite_cubit.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:coffe_shop/services/favorites_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({super.key, required this.product});

  final Product product;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFavorite = (state is FavoriteUpdated)
            ? state.isFavoriteMap[product.id] ?? false
            : false;

        return Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            Spacer(),
            Text(
              "Detail",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Sora",
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                context.read<FavoriteCubit>().toggleFavorite(product.id);
              },
              icon: isFavorite
                  ? Icon(IconlyBold.heart, color: Colors.red)
                  : Icon(IconlyLight.heart),
            ),
          ],
        );
      },
    );
  }
}
