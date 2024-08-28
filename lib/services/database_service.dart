import '../models/service_model.dart';

class DatabaseService {
  // Sample list of services
  final List<Service> _services = [
    Service(
      id: '1',
      name: 'House Cleaning',
      category: 'Cleaning',
      price: 50.0,
      description: 'Professional house cleaning service.',
    ),
    Service(
      id: '2',
      name: 'AC Repair',
      category: 'Repairing',
      price: 75.0,
      description: 'Expert AC repair services.',
    ),
    // Add more services here
  ];

  Future<List<Service>> getServices(String category) async {
    return _services.where((service) => service.category == category).toList();
  }

  Future<void> bookService(Service service) async {
    // Implement your booking logic here
    // For now, we just print the service details
    print('Service booked: ${service.name}, Price: ${service.price}');
  }
}
