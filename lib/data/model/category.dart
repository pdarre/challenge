class Category {
  final String? color;
  final String? name;
  bool? isExpanded;
  Category({
    this.color,
    this.name,
    this.isExpanded,
  });

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'name': name,
      'isExpanded': isExpanded,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      color: json['color'] ?? 'color not available',
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
