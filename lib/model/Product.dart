class Product {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Product({this.id, this.name, this.description, this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['product_id'],
      name: json['product_name'],
      description: json['product_desc'],
      imageUrl: json['product_image'],
    );
  }
}
