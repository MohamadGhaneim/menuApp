class Offer {
  List<ImagePath> images;
  Offer({required this.images});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      images:
          (json['imagePath'] as List<dynamic>)
              .map((e) => ImagePath.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'imagePath': images.map((e) => e.toJson()).toList()};
  }
}

class ImagePath {
  final String imagePath;

  ImagePath({required this.imagePath});

  factory ImagePath.fromJson(Map<String, dynamic> json) {
    return ImagePath(imagePath: json['imagePath'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'imagePath': imagePath};
  }
}
