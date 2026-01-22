import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:coffe_shop/services/favorites_service.dart';
import 'package:coffe_shop/services/product_service.dart';
import 'package:flutter/material.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoritesService, this.productService)
    : super(FavoriteInitial());

  final FavoritesService favoritesService;
  final ProductService productService;
  List<Product> allProducts = [];
  Map<String, bool> isFavoriteMap = {};
  List<Product> favorites = [];
  Set<String> favoritesIDs = {};
  bool isLoading = false;

  Future<void> initFavorites() async {
    await getAllPRoducts();
    await getAllFavorites();
  }

  void resetFavorites() {
    favoritesIDs.clear();
    isFavoriteMap.clear();
    favorites.clear();
    emit(FavoriteInitial());
  }

  Future<void> getAllPRoducts() async {
    allProducts = await productService.getAllProducts();
  }

  Future<void> getAllFavorites() async {
    favorites.clear();
    favoritesIDs.clear();
    isFavoriteMap.clear();
    favoritesIDs = await favoritesService.getAllFavoritesID();
    for (var id in favoritesIDs) {
      isFavoriteMap[id] = true;
    }
    favorites = allProducts
        .where((element) => favoritesIDs.contains(element.id))
        .toList();
    emit(
      FavoriteUpdated(
        isFavoriteMap: Map.from(isFavoriteMap),
        favorites: List.from(favorites),
      ),
    );
  }

  Future<void> toggleFavorite(String productId) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    final currentlyFavorite = isFavoriteMap[productId] ?? false;
    isFavoriteMap[productId] = !currentlyFavorite;

    try {
      if (currentlyFavorite) {
        favorites.removeWhere((element) => element.id == productId);
        emit(
          FavoriteUpdated(isFavoriteMap: isFavoriteMap, favorites: favorites),
        );
        await favoritesService.removeFromFavorites(productId);
      } else {
        favorites.add(
          allProducts.firstWhere((element) => element.id == productId),
        );
        emit(
          FavoriteUpdated(isFavoriteMap: isFavoriteMap, favorites: favorites),
        );
        await favoritesService.addtoFavorites(productId);
      }
    } catch (e) {
      if (currentlyFavorite) {
        isFavoriteMap[productId] = currentlyFavorite;

        favorites.add(
          allProducts.firstWhere((element) => element.id == productId),
        );
        emit(
          FavoriteUpdated(
            isFavoriteMap: Map.from(isFavoriteMap),
            favorites: List.from(favorites),
          ),
        );
        log(e.toString());
      } else {
        isFavoriteMap[productId] = currentlyFavorite;
        favorites.removeWhere((element) => element.id == productId);
        emit(
          FavoriteUpdated(
            isFavoriteMap: Map.from(isFavoriteMap),
            favorites: List.from(favorites),
          ),
        );
        log(e.toString());
      }
    }
    isLoading = false;
  }
}
