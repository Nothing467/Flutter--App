import 'package:flutter/material.dart';

class PetServiceDetailScreen extends StatelessWidget {
  final String serviceId;

  PetServiceDetailScreen({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Service Detail'),
      ),
      body: Center(
        child: Text('Detail for Pet Service ID: $serviceId'),
      ),
    );
  }
}
