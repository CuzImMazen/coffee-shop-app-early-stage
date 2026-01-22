import 'package:coffe_shop/Components/FavoriteBodyComponents/FavoriteCoffeContainer.dart';
import 'package:coffe_shop/Components/HomeBody_Components/Widgets/product_container.dart';
import 'package:coffe_shop/cubits/FavoriteCubit/favorite_cubit.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:coffe_shop/services/favorites_service.dart';
import 'package:coffe_shop/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Favourites",
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Sora",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteInitial) {
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xFF947257)),
                );
              } else if (state is FavoriteError) {
                return Center(child: Text(state.errorMessage));
              } else if (state is FavoriteUpdated) {
                if (state.favorites.isEmpty) {
                  return const Center(
                    child: Text(
                      "You have no favourites yet",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
                final favorites = state.favorites;
                return Expanded(
                  child: ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) =>
                        FavoriteCoffeContainer(product: favorites[index]),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
