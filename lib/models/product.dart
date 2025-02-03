class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final String description; 

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.description, 
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Use 10.0.2.2 for Android emulator
    const String emulatorBaseUrl = 'http://10.0.2.2:8000/';

    // Assuming your database stores the relative path as "products/filename.jpg"
    String relativePath = json['image'] ?? '';
    String fullUrl = emulatorBaseUrl + 'storage/' + relativePath;

    print("DEBUG: Final Image URL: $fullUrl"); // Debug: Check this URL in the debug console

    return Product(
      name: json['name'] ?? '',
      imageUrl: fullUrl, 
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      category: json['category'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
