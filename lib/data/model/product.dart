import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String category;
  final String description;
  final String image;
  final String name;
  Product({
    required this.category,
    required this.description,
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'description': description,
      'image': image,
      'name': name,
    };
  }

  Product.fromDocumentSnapshot(QueryDocumentSnapshot<Object?> doc)
      : category = doc['category'],
        description = doc['description'],
        image = doc['image'],
        name = doc['name'];

  Product copyWith({
    required String category,
    required String description,
    required String image,
    required String name,
  }) {
    return Product(
      category: this.category,
      description: this.description,
      image: this.image,
      name: this.name,
    );
  }
}
