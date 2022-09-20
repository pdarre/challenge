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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      category: json['category'] ?? 'category not available',
      description: json['description'] ?? 'description not available',
      image: json['image'] ?? 'image not available',
      name: json['name'] ?? 'name not available',
    );
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
