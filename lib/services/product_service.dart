import 'package:coffe_shop/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  SupabaseClient supabaseClient = Supabase.instance.client;
  Future<List<Product>> getAllProducts() async {
    final res = await supabaseClient.from('products').select('*');
    List data = (res as List);
    return data.map((json) {
      return Product.fromjson(json);
    }).toList();
  }

  Stream<List<Product>> getProductsStream() {
    return supabaseClient.from("products").stream(primaryKey: ['id']).map((
      eventList,
    ) {
      return eventList.map((json) {
        return Product.fromjson(json);
      }).toList();
    });
  }

  Future<List<Product>> getProductsbyID(Set<String> productIDs) async {
    if (productIDs.isEmpty) {
      return [];
    }

    final idsString = '(${productIDs.join(',')})';
    final res = await supabaseClient
        .from('products')
        .select('*')
        .filter('id', 'in', idsString);
    List data = (res as List);
    return data.map((json) {
      return Product.fromjson(json);
    }).toList();
  }
}
