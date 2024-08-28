import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final String serviceId;

  EventDetailScreen({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Detail'),
      ),
      body: Center(
        child: Text('Detail for Event Service ID: $serviceId'),
      ),
    );
  }
}
