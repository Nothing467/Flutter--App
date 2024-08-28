import 'package:flutter/material.dart';

class LaundryDetailScreen extends StatelessWidget {
  final String serviceId;

  LaundryDetailScreen({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry Service Detail'),
      ),
      body: Center(
        child: Text('Detail for Laundry Service ID: $serviceId'),
      ),
    );
  }
}
