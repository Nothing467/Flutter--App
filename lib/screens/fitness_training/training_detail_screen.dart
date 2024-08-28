import 'package:flutter/material.dart';

class TrainingDetailScreen extends StatelessWidget {
  final String serviceId;

  TrainingDetailScreen({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Detail'),
      ),
      body: Center(
        child: Text('Detail for Training Service ID: $serviceId'),
      ),
    );
  }
}
