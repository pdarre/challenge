class Category {
  final int? catId;
  final String? color;
  final String? name;
  bool? isExpanded;
  Category({
    this.color,
    this.name,
    this.isExpanded,
    this.catId,
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
