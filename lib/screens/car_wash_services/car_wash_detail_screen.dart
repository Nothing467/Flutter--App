import 'package:flutter/material.dart';

class CarWashDetailScreen extends StatelessWidget {
  final String serviceId;

  CarWashDetailScreen({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Wash Detail'),
      ),
      body: Center(
        child: Text('Detail for Car Wash Service ID: $serviceId'),
      ),
    );
  }
}
