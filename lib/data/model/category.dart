import 'dart:convert';

import 'package:challenge/data/model/product.dart';

class Category {
  final String? color;
  final String name;
  bool isExpanded;
  Category({
    required this.color,
    required this.name,
    required this.isExpanded,
  });

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'name': name,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      color: json['color'],
      name: json['name'] ?? 'name not available',
      isExpanded: json['isExpanded'] ?? false,
    );
  }

  Category copyWith({
    required String color,
    required String name,
    required bool isExpanded,
  }) {
    return Category(
      color: this.color,
      name: this.name,
      isExpanded: this.isExpanded,
    );
  }
}
