import 'package:coffe_shop/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesService {
  SupabaseClient supabaseClient = Supabase.instance.client;

  Future<void> addtoFavorites(String productId) async {
    try {
      if (supabaseClient.auth.currentUser == null) {
        return;
      }
      String userId = supabaseClient.auth.currentUser!.id;
      await supabaseClient.from('favorites').upsert({
        'user_id': userId,
        'product_id': productId,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeFromFavorites(String productId) async {
    try {
      if (supabaseClient.auth.currentUser == null) {
        return;
      }
      String userId = supabaseClient.auth.currentUser!.id;
      await supabaseClient
          .from('favorites')
          .delete()
          .eq('user_id', userId)
          .eq('product_id', productId);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkIfFavorite(String productId) async {
    if (supabaseClient.auth.currentUser == null) {
      return false;
    }
    String userId = supabaseClient.auth.currentUser!.id;
    final res = await supabaseClient
        .from('favorites')
        .select('product_id')
        .eq("user_id", userId)
        .eq('product_id', productId)
        .maybeSingle();
    return res != null;
  }

  Future<Set<String>> getAllFavoritesID() async {
    if (supabaseClient.auth.currentUser == null) {
      return <String>{};
    }
    String userId = supabaseClient.auth.currentUser!.id;
    final res = await supabaseClient
        .from('favorites')
        .select('product_id')
        .eq("user_id", userId);

    return (res as List).map((row) => (row['product_id']).toString()).toSet();
  }

  Future<Product> getProductById(String productId) async {
    String userId = supabaseClient.auth.currentUser!.id;
    final res = await supabaseClient
        .from('products')
        .select('*')
        .eq('id', productId);

    return Product.fromjson(res.first);
  }
}
