import 'package:flutter/material.dart';

class TutoringServiceDetailScreen extends StatelessWidget {
  final String serviceId;

  TutoringServiceDetailScreen({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutoring Service Detail'),
      ),
      body: Center(
        child: Text('Detail for Tutoring Service ID: $serviceId'),
      ),
    );
  }
}
