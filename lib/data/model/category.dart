import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String color;
  final String name;
  Category({
    required this.color,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'name': name,
    };
  }

  Category.fromDocumentSnapshot(QueryDocumentSnapshot<Object?> doc)
      : color = doc['color'],
        name = doc['name'];

  Category copyWith({
    required String color,
    required String name,
  }) {
    return Category(
      color: this.color,
      name: this.name,
    );
  }
}
