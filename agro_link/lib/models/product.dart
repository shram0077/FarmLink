class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final String sellerName;
  final String sellerImageUrl;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final bool isFarmerProduct;
  final List<String> tags;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.sellerName,
    required this.sellerImageUrl,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    required this.isFarmerProduct,
    required this.tags,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
      sellerName: json['sellerName'] ?? '',
      sellerImageUrl: json['sellerImageUrl'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isAvailable: json['isAvailable'] ?? true,
      isFarmerProduct: json['isFarmerProduct'] ?? false,
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'sellerName': sellerName,
      'sellerImageUrl': sellerImageUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'isFarmerProduct': isFarmerProduct,
      'tags': tags,
    };
  }
}
