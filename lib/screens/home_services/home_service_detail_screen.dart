import 'package:flutter/material.dart';

class HomeServiceDetailScreen extends StatelessWidget {
  final String serviceId;

  HomeServiceDetailScreen({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Service Detail'),
      ),
      body: Center(
        child: Text('Detail for Home Service ID: $serviceId'),
      ),
    );
  }
}
