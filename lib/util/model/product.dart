class Product {
  final String title;
  final String description;
  final double price;
  final double oldPrice;
  final String imagePath;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      oldPrice: (json['oldPrice'] ?? 0).toDouble(),
      imagePath: json['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'oldPrice': oldPrice,
      'imagePath': imagePath,
    };
  }
}
