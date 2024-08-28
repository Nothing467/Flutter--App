class Service {
  final String id;
  final String name;
  final String category;
  final double price;
  final String description;

  Service({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
  });

  factory Service.fromMap(Map<String, dynamic> data) {
    return Service(
      id: data['id'],
      name: data['name'],
      category: data['category'],
      price: data['price'],
      description: data['description'],
    );
  }
}
