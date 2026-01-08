class Category {
  final String description;
  final String imagePath;

  Category({required this.description, required this.imagePath});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      description: json['description'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'description': description, 'imagePath': imagePath};
  }
}
