import 'package:coffe_shop/services/favorites_service.dart';

class Product {
  final String id;
  final String name;
  final String title;
  final String? description;
  final String image;
  final num price;
  final String category;
  final num rate;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.title,
    required this.image,
    required this.price,
    required this.category,
    required this.rate,
  });
  factory Product.fromjson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'],
      title: json['title'],
      image: json['image_url'],
      price: json['price'],
      category: json['category'],
      rate: json['rate'],
    );
  }
}
