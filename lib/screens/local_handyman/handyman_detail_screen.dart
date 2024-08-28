import 'package:flutter/material.dart';

class HandymanDetailScreen extends StatelessWidget {
  final String serviceId;

  HandymanDetailScreen({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handyman Service Detail'),
      ),
      body: Center(
        child: Text('Detail for Handyman Service ID: $serviceId'),
      ),
    );
  }
}
