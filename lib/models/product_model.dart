class ProductModel {
  final String name;
  final String image;
  final String description;
  final String tryOnImage;
  final double price;
  ProductModel({
    required this.name,
    required this.tryOnImage,
    required this.image,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      tryOnImage: json['tryOn_image'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'tryOn_image': tryOnImage,
      'price': price,
    };
  }
}
