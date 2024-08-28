import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../models/service_model.dart';

class ServiceProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  List<Service> _services = [];

  List<Service> get services => _services;

  Future<void> loadServices(String category) async {
    _services = await _databaseService.getServices(category);
    notifyListeners();
  }

  Future<void> bookService(Service service) async {
    await _databaseService.bookService(service);
    notifyListeners();
  }
}
