part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoriteUpdated extends FavoriteState {
  final Map<String, bool> isFavoriteMap;
  final List<Product> favorites;
  FavoriteUpdated({required this.isFavoriteMap, required this.favorites});
}

class FavoriteError extends FavoriteState {
  final String errorMessage;
  FavoriteError({required this.errorMessage});
}
